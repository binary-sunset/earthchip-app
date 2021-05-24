class CreateDeviceLights < ActiveRecord::Migration[6.1]
  def change
    create_table :device_lights do |t|
      t.references :device, null: false, foreign_key: true
      t.float :value

      t.timestamps
    end
  end
end
