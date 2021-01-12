class StudentsController < ApplicationController
  before_action :set_account

  def show
    @student = @account.students.find(params[:id])
  end

  def new
    @student = @account.students.new
  end
  
  def create
    @student = @account.students.new(student_params)
    
    if(@student.save)
      redirect_to @account
    else
      render :new
    end
  end

  def update
    @student = @account.students.find(params[:id])

    if @student.update(student_params)
      redirect_to @account
    else
      render :show
    end
  end

  def destroy
    @student = @account.students.find(params[:id])
    @student.destroy

    redirect_to @account
  end
  
  private

    def student_params
      params.require(:student).permit(:firstName, :lastName, :age, :primary)
    end

    def set_account 
      @account = Account.find(params[:account_id])
    end
end

