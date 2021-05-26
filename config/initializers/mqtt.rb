Thread.new do
  client = MQTT::Client.connect(
    host: ENV["mqtt_host"],
    port: ENV["mqtt_port"]
  )

  client.subscribe('+/humidity', '+/light')
  client.get do |topic, message|
    device_id = topic.split("/").first

    unless Device.exists?(device_id)
      Device.create!(id: device_id, alias: device_id)
    end

    measurement = topic.split('/').last

    case measurement
    when 'humidity'
      DeviceHumidity.create!(device_id: device_id, value: message.to_f, created_at: Time.now)
    when 'light'
      DeviceLight.create!(device_id: device_id, value: message.to_f, created_at: Time.now)
    else
      raise 'Measurement not defined'
    end
  end
end