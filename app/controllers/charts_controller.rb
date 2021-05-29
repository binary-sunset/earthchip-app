class ChartsController < ApplicationController
  before_action :set_device

  def humidity_stats
    render json: DeviceStatsBlueprint.render(@device.humidity_stats)
  end

  def light_stats
    render json: DeviceStatsBlueprint.render(@device.light_stats)
  end

  def temperature_stats
    render json: DeviceStatsBlueprint.render(@device.temperature_stats)
  end

  private

  def set_device
    @device = Device.find(params[:device_id])
  end
end
