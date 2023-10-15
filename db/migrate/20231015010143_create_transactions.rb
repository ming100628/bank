class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.float :amount
      t.datetime :transaction_date
      t.timestamps
    end
  end
end
