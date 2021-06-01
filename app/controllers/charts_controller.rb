class ChartsController < ApplicationController
  before_action :set_device
  
  def graph_stats
    render json: @device.aggregated(params[:measurement]).chart_data
  end

  private

  def set_device
    @device = Device.find(params[:device_id])
  end

end
