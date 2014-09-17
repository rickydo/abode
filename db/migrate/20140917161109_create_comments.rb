class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :type
      t.integer :commentable_id
      t.text :description

      t.timestamps
    end
  end
end
