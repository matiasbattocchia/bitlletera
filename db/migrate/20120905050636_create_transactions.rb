class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :sender_account, polymorphic: true
      t.references :receiver_account, polymorphic: true
      t.references :examined_by
      t.integer :amount
      t.string :status

      t.timestamps
    end
    add_index :transactions, :sender_account_id
    add_index :transactions, :receiver_account_id
    add_index :transactions, :examined_by_id
  end
end
