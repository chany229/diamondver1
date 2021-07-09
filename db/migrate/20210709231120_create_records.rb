class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string  :ip_string
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
