class ExternalAccountsController < ApplicationController
  # GET /external_accounts
  # GET /external_accounts.json
  def index
    @external_accounts = ExternalAccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @external_accounts }
    end
  end

  # GET /external_accounts/1
  # GET /external_accounts/1.json
  def show
    @external_account = ExternalAccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @external_account }
    end
  end

  # GET /external_accounts/new
  # GET /external_accounts/new.json
  def new
    @external_account = ExternalAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @external_account }
    end
  end

  # GET /external_accounts/1/edit
  def edit
    @external_account = ExternalAccount.find(params[:id])
  end

  # POST /external_accounts
  # POST /external_accounts.json
  def create
    @external_account = ExternalAccount.new(params[:external_account])

    respond_to do |format|
      if @external_account.save
        format.html { redirect_to @external_account, notice: 'External account was successfully created.' }
        format.json { render json: @external_account, status: :created, location: @external_account }
      else
        format.html { render action: "new" }
        format.json { render json: @external_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /external_accounts/1
  # PUT /external_accounts/1.json
  def update
    @external_account = ExternalAccount.find(params[:id])

    respond_to do |format|
      if @external_account.update_attributes(params[:external_account])
        format.html { redirect_to @external_account, notice: 'External account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @external_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /external_accounts/1
  # DELETE /external_accounts/1.json
  def destroy
    @external_account = ExternalAccount.find(params[:id])
    @external_account.destroy

    respond_to do |format|
      format.html { redirect_to external_accounts_url }
      format.json { head :no_content }
    end
  end
end
