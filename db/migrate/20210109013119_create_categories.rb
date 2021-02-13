class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :desc
      t.integer :father_id
      t.integer :position
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
