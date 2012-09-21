# encoding: UTF-8
class DepositsController < ApplicationController
  def index
    @deposits = current_user.external_accounts.map(&:outgoing_transactions).flatten!

    respond_to do |format|
      format.html
      format.json { render json: @deposits }
    end
  end
  
  def show
    @deposit = Transaction.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @deposit }
    end
  end
  
  def new
    @external_accounts = current_user.external_accounts
    @accounts = current_user.accounts
    @deposit = Transaction.new

    respond_to do |format|
      format.html
      format.json { render json: @deposit }
    end
  end

  def create
    if params[:create]
      @external_accounts = current_user.external_accounts
      @accounts = current_user.accounts
      @deposit = Transaction.new
      @deposit.amount = params[:transaction][:amount]
      @deposit.sender_account = @external_accounts.find_by_id!(params[:transaction][:sender_account_id])
      @deposit.receiver_account = @accounts.find_by_id!(params[:transaction][:receiver_account_id])

      respond_to do |format|
        if @deposit.save
          format.html { redirect_to @deposit, notice: 'Depósito en proceso' }
          format.json { render json: @deposit, status: :created, location: @deposit }
        else
          format.html { render action: 'new' }
          format.json { render json: @deposit.errors, status: :unprocessable_entity }
        end
      end
    elsif params[:back]
      respond_to do |format|
        format.html { redirect_to deposits_url }
        format.json { head :no_content }
      end
    end
  end

end
