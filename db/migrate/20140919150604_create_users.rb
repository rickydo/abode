class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.references :dwelling, index: true
      t.string :remember_token, index: true

      t.timestamps
    end
  end
end
