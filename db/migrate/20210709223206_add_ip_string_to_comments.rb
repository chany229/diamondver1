class AddIpStringToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :ip_string, :string
  end
end
