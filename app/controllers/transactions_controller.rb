class TransactionsController < ApplicationController
  def new

  end

  def create
    receiver = Account.find_by(id: params[:recipient_account_id])
    sender = Account.find_by(id: params[:sender_account_id])
    if (sender.balance - params[:amount].to_f) < 0
      flash[:notice] = 'Insufficient balance'
      render :new
    else
      ActiveRecord::Base.transaction do
        sender.update!(balance: (sender.balance - params[:amount].to_f))
        receiver.update!(balance: (receiver.balance + params[:amount].to_f))
        Transaction.create!(
          sender:,
          receiver:,
          amount: params[:amount].to_f
        )
      end
      redirect_to "/accounts"
    end
  end
end
