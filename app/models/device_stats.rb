class DeviceStats < ApplicationRecord
  belongs_to :device

  enum measurement: %i[humidity light temperature]

  after_create_commit { broadcast_replace_to :devices, target: "device_#{device.id}_last_#{measurement}", locals: { device: self.device, measurement: self.measurement } }

end
