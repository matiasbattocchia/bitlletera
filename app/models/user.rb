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

  after_create :crear_cuentas

  has_many :ads, dependent: :destroy
  has_many :accounts
  has_many :external_accounts

  def ars
    accounts.where(currency: 'ARS').first
  end

  def usd
    accounts.where(currency: 'USD').first
  end

  def btc
    accounts.where(currency: 'BTC').first
  end

  private

    def crear_cuentas
      accounts.create currency: 'ARS'
      accounts.create currency: 'BTC'
      accounts.create currency: 'USD'
    end

end
