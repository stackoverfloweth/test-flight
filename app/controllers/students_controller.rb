class StudentsController < ApplicationController
    def create
        @account = Account.find(params[:account_id])
        @student = @account.students.create(student_params)
        redirect_to account_path(@account)
      end
    
      private
        def student_params
          params.require(:student).permit(:firstName, :lastName, :age, :verified)
        end
end
