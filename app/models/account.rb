# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  currency   :string
#  balance    :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Account < ApplicationRecord
  belongs_to :user
  validates :currency, presence: true
  validates :balance, presence: true
end
