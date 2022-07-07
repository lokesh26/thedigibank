class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :transaction_uuid
      t.references :sender, null: false
      t.references :receiver, null: false

      t.timestamps
    end

    add_foreign_key :transactions, :accounts, column: :sender_id, primary_key: :id
    add_foreign_key :transactions, :accounts, column: :receiver_id, primary_key: :id    
  end
end
