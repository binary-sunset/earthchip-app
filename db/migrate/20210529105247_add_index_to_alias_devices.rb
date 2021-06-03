class AddIndexToAliasDevices < ActiveRecord::Migration[6.1]
  def change
    add_index :devices, :alias, unique: true
  end
end
