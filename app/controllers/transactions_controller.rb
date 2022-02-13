class TransactionsController < ApplicationController
    def index
        all_transactions = transaction_service.all
        render json: all_transactions
    end

    def show
        transaction_info = transaction_service.info(params[:id])
        if transaction_info.nil?
            render json: { error: "Transaction not found" }, status: 404
        else
            render json: transaction_info
        end
    end

    def create
        transaction = transaction_service.create(transaction_params)
        if transaction.nil?
            render json: { error: "Transaction not created" }, status: 422
        else
            render json: transaction
        end
    end

    private
    def transaction_params
        params.require(:transaction).permit(:customer_id, :input_amount, :input_currency, :output_amount, :output_currency)
    end

    def transaction_service
        @transaction_service ||= TransactionService.new
    end
end
