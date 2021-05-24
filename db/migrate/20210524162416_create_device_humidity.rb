class CreateDeviceHumidities < ActiveRecord::Migration[6.1]
  def change
    create_table :device_humidities do |t|
      t.references :device, null: false, foreign_key: true
      t.float :value
      t.datetime :created_at
    end
  end
end
