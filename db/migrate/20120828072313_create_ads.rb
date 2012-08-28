class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.decimal :amount
      t.string  :area
      t.decimal :price,         scale: 5, precision: 10
      t.string  :transaction,   default: 'buy', null: false
      t.string  :method

      t.belongs_to :user

      t.timestamps
    end
  end
end
