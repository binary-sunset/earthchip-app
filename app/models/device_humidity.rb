class DeviceHumidity < ApplicationRecord
  belongs_to :device

  after_create_commit { broadcast_replace_to :devices, target: "device_#{device.id}_last_humidity" }

end
