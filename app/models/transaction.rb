# == Schema Information
#
# Table name: transactions
#
#  id               :bigint           not null, primary key
#  sender_id        :integer
#  receiver_id      :integer
#  amount           :float
#  transaction_date :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  validates :amount, presence: true
end
