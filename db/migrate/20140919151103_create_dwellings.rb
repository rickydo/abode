class CreateDwellings < ActiveRecord::Migration
  def change
    create_table :dwellings do |t|
      t.string :name
      t.string :address
      t.belongs_to :admin
      t.string :secret_key

      t.timestamps
    end
  end
end
