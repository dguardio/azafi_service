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

  private
  def transaction_publisher(transaction)
    @transaction_publisher ||= TransactionPublisher.new(transaction)
  end
end