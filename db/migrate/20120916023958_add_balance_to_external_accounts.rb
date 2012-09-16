class AddBalanceToExternalAccounts < ActiveRecord::Migration
  def change
    add_column :external_accounts, :balance, :integer
  end
end
