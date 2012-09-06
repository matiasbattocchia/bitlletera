class Transaction < ActiveRecord::Base
  belongs_to :sender_account, polymorphic: true
  belongs_to :receiver_account, polymorphic: true
  belongs_to :examined_by, class_name: 'User'

  attr_accessible :amount, :status

  validates :amount, :numericality => {greater_than: 0}
end
