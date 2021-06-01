Thread.new do
  client = MQTT::Client.connect(
    host: ENV['MQTT_HOST'],
    port: ENV['MQTT_PORT']
  )

  client.subscribe('+/humidity')
  client.subscribe('+/light')
  client.subscribe('+/temperature')
  client.subscribe('+/moisture')

  client.get do |topic, value|
    device_alias, measurement = topic.split('/')

    begin
      device = Device.find_or_create_by!(alias: device_alias) do |d|
        d.alias = device_alias
        d.name = device_alias
      end
      DeviceStats.create!(device: device, value: value.to_f, measurement: measurement, created_at: Time.now)
    rescue StandardError => e
      Rails.logger.error "Something went wrong: #{e.inspect}"
    end
  end
end