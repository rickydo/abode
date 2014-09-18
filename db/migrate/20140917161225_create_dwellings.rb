class CreateDwellings < ActiveRecord::Migration
  def change
    create_table :dwellings do |t|
      t.string :address
      t.string :name
      t.integer :admin_id
      t.string :secret_key

      t.timestamps
    end
  end
end
