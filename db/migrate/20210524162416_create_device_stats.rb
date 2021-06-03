class CreateDeviceStats < ActiveRecord::Migration[6.1]
  def change
    create_table :device_stats do |t|
      t.references :device, null: false, foreign_key: true
      t.float :value
      t.integer :measurement
      t.datetime :created_at
    end
  end
end
