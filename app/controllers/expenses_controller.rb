class ExpensesController < ApplicationController
  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      render partial: 'new', locals: {expense: Expense.new}
    else
      flash.now[:error]
      render partial: 'new', locals: {expense: @expense}
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :description, :amount, :payer_id)
  end
end
