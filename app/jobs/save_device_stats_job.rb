class SaveDeviceStatsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    device_alias, measurement, value, created_at = args
    device = Device.find_or_create_by!(alias: device_alias) do |d|
      d.alias = device_alias
      d.name = device_alias
    end
    DeviceStats.create!(device: device, value: value.to_f, measurement: measurement, created_at: created_at)
  end
end
