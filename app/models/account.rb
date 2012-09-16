class Account < ActiveRecord::Base
  has_many  :incoming_transactions,
            as: :receiver_account,
            class_name: 'Transaction'
  
  has_many  :outgoing_transactions,
            as: :sender_account,
            class_name: 'Transaction'
  
  belongs_to :user
 
  attr_accessible :balance, :currency, :status
  
  after_initialize :set_default_values, on: :create

  # Send 'amount' of money to 'account'.
  def transfer amount, account
    Transaction.between self, account, amount
  end

  def deposit amount
    self[:balance] += amount
  end

  def withdraw amount
    self[:balance] += amount
  end

  private
  
  def set_default_values
    self[:balance] ||= 0
  end
end
