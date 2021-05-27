class Device < ApplicationRecord
  has_many :humidities, class_name: :DeviceHumidity, dependent: :destroy

  broadcasts_to ->(_device) { 'devices' }, target: :devices

  def last_humidity
    humidities.last
  end
end
