class CreateUserExpenses < ActiveRecord::Migration
  def change
    create_table :user_expenses do |t|
      t.integer :user_id
      t.integer :expense_id
      t.decimal :owed
      t.decimal :paid

      t.timestamps
    end
  end
end
