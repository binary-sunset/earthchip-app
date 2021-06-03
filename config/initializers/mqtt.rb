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
    created_at = Time.now

    SaveDeviceStatsJob.perform_later(device_alias, measurement, value, created_at)
  end
end