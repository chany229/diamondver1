class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :username
      t.integer :user_id
      t.text :useragent
      t.text :comment
      t.integer :entry_id

      t.timestamps
    end
  end
end
