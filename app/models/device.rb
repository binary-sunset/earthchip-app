class Device < ApplicationRecord
  has_many :humidities, class_name: :DeviceHumidity
  has_many :lights, class_name: :DeviceLight


  def last_humidity
    humidities.last!.value
  rescue StandardError
    'N/A'
  end

  def last_light
    lights.last!.value
  rescue StandardError
    'N/A'
  end
end
