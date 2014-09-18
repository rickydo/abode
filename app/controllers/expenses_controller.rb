class ExpensesController < ApplicationController
  def create
    @expense = Expense.new(expense_params)
    @expense.payer = current_user
    if @expense.save
      render partial: 'new', locals: {expense: Expense.new}
    else
      flash.now[:error] = "Expenses need a name and an amount"
      render partial: 'new', locals: {expense: @expense}
    end
  end

  # def show
  #   @expense = Expense.find(params[:expense_id])
  #   render partial: 'expense', locals: {expense: @expense}
  # end

  def index
    @dwelling = Dwelling.find(current_user.dwelling_id)
    render partial: @dwelling.expenses
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :description, :amount, :payer_id)
  end
end
