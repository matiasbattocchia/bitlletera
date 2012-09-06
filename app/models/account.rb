class Account < ActiveRecord::Base
  has_many  :incoming_transactions, as: :receiver_account
  has_many  :outgoing_transactions, as: :sender_account
  belongs_to :user
  
  attr_accessible :balance, :currency
  
  after_initialize :default_values
  
  private
  
  def default_values
    self.balance = 0
  end
end
