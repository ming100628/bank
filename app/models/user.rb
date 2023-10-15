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
class User < ApplicationRecord
  has_many :accounts
  has_many :receive_moneys, class_name: 'Transaction', foreign_key: 'receiver_id'
  has_many :send_moneys, class_name: 'Transaction', foreign_key: 'sender_id'
  validates :username, presence: true
  validates :password_hash, presence: true
end
