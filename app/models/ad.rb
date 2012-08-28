class Ad < ActiveRecord::Base
  attr_accessible :amount, :area, :method, :price, :transaction

  belongs_to :user

  validates_inclusion_of :transaction, in: ['buy', 'sell']
  validates_numericality_of :amount, allow_nil: true, greater_than: 0
  validates_numericality_of :price, greater_than: 0
end
