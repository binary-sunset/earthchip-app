Thread.new do
  client = MQTT::Client.connect(
    host: ENV['mqtt_host'],
    port: ENV['mqtt_port']
  )

  client.subscribe('+/humidity')
  client.subscribe('+/light')
  client.subscribe('+/temperature')

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