class StudentsController < ApplicationController

  def show
    @account = Account.find(params[:account_id])
    @student = @account.students.find(params[:id])
  end

  def new
    @account = Account.find(params[:account_id])
    @student = @account.students.new
  end
  
  def create
    @account = Account.find(params[:account_id])
    @student = @account.students.new(student_params)
    
    if(@student.save)
      redirect_to @account
    else
      render :new
    end
  end

  def update
    @account = Account.find(params[:account_id])
    @student = @account.students.find(params[:id])

    if(@student.update(student_params))
      redirect_to @account
    else
      render :show
    end
  end

  def destroy
    @account = Account.find(params[:account_id])
    @student = @account.students.find(params[:id])
    @student.destroy

    redirect_to @account
  end
  
  private
    def student_params
      params.require(:student).permit(:firstName, :lastName, :age, :verified)
    end
end
