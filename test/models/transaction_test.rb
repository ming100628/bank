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
require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
