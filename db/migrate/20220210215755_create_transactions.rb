class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions, id: :uuid do |t|
      t.string :customer_id
      t.decimal :input_amount, precision: 10, scale: 2
      t.string :input_currency
      t.decimal :output_amount, precision: 10, scale: 2
      t.string :output_currency
      t.timestamps
    end
  end
end
