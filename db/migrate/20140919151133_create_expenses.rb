class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :description
      t.float :amount
      t.belongs_to :payer

      t.timestamps
    end
  end
end
