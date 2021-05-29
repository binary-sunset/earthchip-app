class ChartsController < ApplicationController
  before_action :set_device

  def humidity_stats
    render json: @device.humidity_stats.group_by_minute(:created_at).average(:value)
  end

  def light_stats
    render json: @device.light_stats.group_by_minute(:created_at).average(:value)
  end

  def temperature_stats
    render json: @device.temperature_stats.group_by_minute(:created_at).average(:value)
  end

  private

  def set_device
    @device = Device.find(params[:device_id])
  end
end
