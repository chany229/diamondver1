class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :desc
      t.text :content
      t.integer :category_id
      t.integer :user_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
