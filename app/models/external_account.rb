class ExternalAccount < ActiveRecord::Base
  has_many  :incoming_transactions, as: :receiver_account
  has_many  :outgoing_transactions, as: :sender_account
  belongs_to :user
  belongs_to :examined_by, class_name: 'User'

  attr_accessible :bank, :currency, :number, :unique_code, :status
  
  after_initialize :default_values

  private
  
  def default_values
    self.status = 'pending'
  end
end
