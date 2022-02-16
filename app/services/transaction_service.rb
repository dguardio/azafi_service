class TransactionService
  def all
    Transaction.all
  end

  def info(transaction_id)
    begin 
      Transaction.find(transaction_id)
    rescue ActiveRecord::RecordNotFound
      Rails.logger.error "Transaction #{transaction_id} not found"
      nil
    end
  end

  def create(transaction_params)
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      transaction_publisher(@transaction).publish
      @transaction
    end
  end

  def update(transaction_params, transaction_id)
    @transaction = Transaction.find(transaction_id)
    if @transaction.update(transaction_params)
        @transaction
    else
        @transaction = nil
    end  
  end

  private
  def transaction_publisher(transaction)
    @transaction_publisher ||= TransactionPublisher.new(transaction)
  end
end