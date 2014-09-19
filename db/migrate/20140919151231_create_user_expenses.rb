class CreateUserExpenses < ActiveRecord::Migration
  def change
    create_table :user_expenses do |t|
      t.references :expense, index: true
      t.references :user, index: true
      t.float :portion
      t.float :paid, default: 0


      t.timestamps
    end
  end
end
