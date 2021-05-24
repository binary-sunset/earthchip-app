Thread.new do
  client = MQTT::Client.connect(
    host: ENV["mqtt_host"],
    port: ENV["mqtt_post"]
  )

  client.subscribe('+/humidity', '+/light')
  client.get do |topic, message|
    p "topic:#{topic}, message: #{message}"
  end
end