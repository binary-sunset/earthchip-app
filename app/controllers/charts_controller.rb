class ChartsController < ApplicationController
  before_action :set_device

  def humidity_stats
    render json: @device.humidity_stats.chart_data
  end

  def light_stats
    render json: @device.light_stats.chart_data
  end

  def temperature_stats
    render json: @device.temperature_stats.chart_data
  end

  private

  def set_device
    @device = Device.find(params[:device_id])
  end

end
