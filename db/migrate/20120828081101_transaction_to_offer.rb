class TransactionToOffer < ActiveRecord::Migration
  def change
    rename_column :ads, :transaction, :offer
  end
end
