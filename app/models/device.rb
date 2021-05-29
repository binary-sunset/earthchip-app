class Device < ApplicationRecord
  has_many :stats, class_name: :DeviceStats, dependent: :destroy

  validates_presence_of :alias

  broadcasts_to ->(_device) { 'devices' }, target: :devices

  def measurements
    stats.distinct.pluck(:measurement)
  end

  def humidity_stats
    stats.humidity
  end

  def light_stats
    stats.light
  end

  def temperature_stats
    stats.temperature
  end
end
