class ContactsController < ApplicationController

  before_action :set_account

  def show
    @contact = @account.contacts.find(params[:id])
  end

  def new
    @contact = @account.contacts.new
    @contact.primary = !@account.contacts.exists?(primary: true)
  end
  
  def create
    @contact = @account.contacts.new(contact_params)
    
    if @contact.save
      redirect_to @account
    else
      render :new
    end
  end

  def update
    @contact = @account.contacts.find(params[:id])

    if @contact.update(contact_params)
      redirect_to @account
    else
      render :show
    end
  end

  def destroy
    @contact = @account.contacts.find(params[:id])
    if @contact.primary
      @contact.errors.add(:primary, :invalid, message: "cannot be deleted")
      render :show
    else
      @contact.destroy
      redirect_to @account
    end
  end
  
  private

  def contact_params
    params[:contact][:phone] = params[:contact][:phone].tr('^0-9', '')
    params.require(:contact).permit(:firstName, :lastName, :email, :phone, :primary)
  end

  def set_account 
    @account = Account.find(params[:account_id])
  end

end
