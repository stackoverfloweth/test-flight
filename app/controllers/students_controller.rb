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
      redirect_to [@account, @student]
    else
      render :new
    end
  end

  def edit
    @account = Account.find(params[:account_id])
    @student = @account.students.build(student_params)
  end

  def update
    @account = Account.find(params[:account_id])
    @student = @account.students.build(student_params)

    if(@account.update(student_params))
      redirect_to [@account, @student]
    else
      render :edit
    end
  end

  def destroy
    @account = Account.find(params[:account_id])
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to @account
  end
  
  private
    def student_params
      params.require(:student).permit(:firstName, :lastName, :age, :verified)
    end
end
