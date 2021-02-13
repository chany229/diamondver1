class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :hashed_password
      t.string :ip
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
