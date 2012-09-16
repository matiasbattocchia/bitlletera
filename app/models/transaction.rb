class Transaction < ActiveRecord::Base
  belongs_to :sender_account, polymorphic: true
  belongs_to :receiver_account, polymorphic: true
  belongs_to :examined_by, class_name: 'User'

  attr_accessible :sender_account, :receiver_account, :amount, :status

  after_initialize :set_default_values, on: :create

  validates :amount, :numericality => {greater_than: 0}

  # TODO: Maybe some of these validations should only run on creation.
  validate  :accounts_currency_sameness,
            :sender_account_status,
            :receiver_account_status

  validate  :sender_account_funds_sufficiency,
            :repeated_accounts_exclusion,
            :external_accounts_exclusion,
            on: :create
            
  around_create :withdraw_funds_from_sender_account
  
  def self.between sender_account, receiver_account, amount
    create sender_account: sender_account, receiver_account: receiver_account, amount: amount
  end

  def accept!
    if self[:status] == 'pending'
      self.transaction do
        self[:status] = 'accepted'
        receiver_account.deposit amount
      end
    else
      raise StandardError, 'A final status cannot be changed'
    end
  end

  def reject!
    if self[:status] == 'pending'
      self.transaction do
        self[:status] = 'rejected'
        sender_account.deposit amount
      end
    else
      raise StandardError, 'A final status cannot be changed'
    end
  end
  
  private
  
  def set_default_values
    self[:status] ||= 'pending'
  end

  def accounts_currency_sameness
    errors.add(:accounts, 'accounts must hold the same currency') unless sender_account.currency == receiver_account.currency
  end

  def repeated_accounts_exclusion
    errors.add(:accounts, 'sender and receiver accounts cannot be the same') if sender_account == receiver_account
  end

  def external_accounts_exclusion
    errors.add(:accounts, 'transactions between external accounts are not allowed') if sender_account.is_a?(ExternalAccount) and receiver_account.is_a?(ExternalAccount)
  end

  def sender_account_status
    errors.add(:accounts, 'sender account is not active') unless sender_account.status == 'active'
  end

  def receiver_account_status
    errors.add(:accounts, 'receiver account is not active') unless receiver_account.status == 'active'
  end
  
  def sender_account_funds_sufficiency
    if sender_account.is_a? Account
      errors.add(:accounts, 'sender account has insufficient funds') if amount > sender_account.balance
    end
  end

  def withdraw_funds_from_sender_account
    sender_account.withdraw amount
  end

end
