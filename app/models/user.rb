# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  username      :string
#  password_hash :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'bcrypt'
class User < ActiveRecord::Base
  has_many :accounts
  has_many :receive_moneys, class_name: 'Transaction', foreign_key: 'receiver_id'
  has_many :send_moneys, class_name: 'Transaction', foreign_key: 'sender_id'
  validates :username, presence: true
  validates :password_hash, presence: true

  # users.password_hash in the database is a :string
  include BCrypt

  before_create :generate_token
  after_create :generate_accounts

  def generate_accounts
    accounts.create(currency: 'USD', balance: 1000, user_id: id)
    accounts.create(currency: 'HKD', balance: 10000, user_id: id)
    accounts.create(currency: 'JPY', balance: 100000, user_id: id)
    accounts.create(currency: 'GBP', balance: 1000, user_id: id)
  end

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

  def update_token
    generate_token
    save!
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
