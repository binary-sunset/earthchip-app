class Device < ApplicationRecord
  has_many :stats, class_name: :DeviceStats, dependent: :destroy
  has_many :aggregated_stats, dependent: :destroy do
    def chart_data
      where(hour_at: (Time.now - 1.week)..Time.now).group_by_hour(:hour_at).average(:value).chart_json
    end
  end

  validates_presence_of :alias, :name

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

  def aggregated(measurement)
    aggregated_stats.send(measurement)
  end

end
