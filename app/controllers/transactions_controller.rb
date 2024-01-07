class TransactionsController < ApplicationController
  def new

  end

  def create
    # protect against sending money from accounts that don't belong to the current user
    # protect against sending money to and from accounts that don't have the same currency
    receiver = Account.find_by(id: params[:recipient_account_id])
    sender = Account.find_by(id: params[:sender_account_id])
    if sender.user_id != current_user.id
      flash.now[:notice] = 'The account does not belong to you'
      render :new
    elsif sender.balance < params[:amount].to_f
      flash.now[:notice] = 'Insufficient balance'
      render :new
    else
      ActiveRecord::Base.transaction do
        if sender.currency == receiver.currency
          sender.update!(balance: (sender.balance - params[:amount].to_f))
          receiver.update!(balance: (receiver.balance + params[:amount].to_f))
        else
          sender.update!(balance: (sender.balance - params[:amount].to_f))
          receiver.update!(balance: (receiver.balance + params[:amount].to_f * ExchangeService.exchange_rate(sender.currency, receiver.currency, 1)))
        end
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
