class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.text :description
      t.decimal :amount
      t.integer :payer_id

      t.timestamps
    end
  end
end
