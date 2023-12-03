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
  belongs_to :sender, class_name: 'Account'
  belongs_to :receiver, class_name: 'Account'
  validates :amount, presence: true
end
