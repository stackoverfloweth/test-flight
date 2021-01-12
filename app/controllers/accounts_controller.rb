class AccountsController < ApplicationController
  
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def show
    unless @account.primary_contact
      @account.errors.add(:base, :invalid, message: "Account must have primary contact!")
    end
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account
    else
      render :new
    end
  end

  def edit; end

  def update
    if @account.update(account_params)
      redirect_to @account
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to root_path
  end

  private 
  
  def account_params
    params.require(:account).permit(:name)
  end

  def set_account 
    @account = Account.find(params[:id])
  end

end
