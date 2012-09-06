class CreateExternalAccounts < ActiveRecord::Migration
  def change
    create_table :external_accounts do |t|
      t.string :bank
      t.integer :number
      t.integer :unique_code
      t.string :currency
      t.string :status
      t.references :user
      t.references :examined_by

      t.timestamps
    end
    add_index :external_accounts, :user_id
    add_index :external_accounts, :examined_by_id 
  end
end
