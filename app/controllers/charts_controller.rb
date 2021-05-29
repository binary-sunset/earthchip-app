class ChartsController < ApplicationController
  before_action :set_device

  def humidity_chart
  end

  def light_chart
  end

  def temperature_chart
  end

  private

  def set_device
    @device = Device.find(params[:device_id])
  end
end
