class ChartsController < ApplicationController
  before_action :set_device

  def humidity_stats
    render json: @device.aggregated('humidity').chart_data
  end

  def light_stats
    render json: @device.aggregated('light').chart_data
  end

  def temperature_stats
    render json: @device.aggregated('temperature').chart_data
  end

  private

  def set_device
    @device = Device.find(params[:device_id])
  end

end
