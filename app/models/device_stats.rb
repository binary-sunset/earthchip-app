class DeviceStats < ApplicationRecord
  belongs_to :device

  enum measurement: %i[humidity light temperature]

  after_create_commit do
    broadcast_replace_to :devices, target: "device_#{device.id}_last_#{measurement}", locals: { device: device, measurement: measurement }
  end

  def value=(val)
    write_attribute(:value, val.round(1))
  end

end
