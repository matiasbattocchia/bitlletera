class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :ads, dependent: :destroy
  has_many :accounts
  has_many :external_accounts

  # Reserved for administrators.
  has_many :examined_transactions, class_name: 'Transaction', foreign_key: :examined_by_id
  has_many :examined_external_accounts, class_name: 'ExternalAccount', foreign_key: :examined_by_id
end
