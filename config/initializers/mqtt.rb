Thread.new do
  client = MQTT::Client.connect(
    host: ENV["mqtt_host"],
    port: ENV["mqtt_port"]
  )

  client.subscribe('+/humidity')

  client.get do |topic, value|
    device_id = topic.split('/').first

    device = Device.find_or_create_by(alias: device_id)

    DeviceHumidity.create!(device: device, value: value.to_f, created_at: Time.now)
  end
end