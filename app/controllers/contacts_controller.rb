class ContactsController < ApplicationController

  def show
    @account = Account.find(params[:account_id])
    @contact = @account.contacts.find(params[:id])
  end

  def new
    @account = Account.find(params[:account_id])
    @contact = @account.contacts.new
  end
  
  def create
    @account = Account.find(params[:account_id])
    @contact = @account.contacts.new(contact_params)
    
    if(@contact.save)
      redirect_to @account
    else
      render :new
    end
  end

  def update
    @account = Account.find(params[:account_id])
    @contact = @account.contacts.find(params[:id])

    if(@contact.update(contact_params))
      redirect_to @account
    else
      render :show
    end
  end

  def destroy
    @account = Account.find(params[:account_id])
    @contact = @account.contacts.find(params[:id])
    @contact.destroy

    redirect_to @account
  end
  
  private
    def contact_params
      params.require(:contact).permit(:firstName, :lastName, :email, :phone, :primary)
    end
end
