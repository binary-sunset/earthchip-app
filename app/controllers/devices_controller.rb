class DevicesController < ApplicationController

  before_action :set_device, only: [:show, :edit, :update]

  def show
    render @device
  end

  def index
    @devices = Device.all
  end

  def edit
  end

  def update
    if @device.update(params.require(:device).permit(:name))
      redirect_to @device
    else
      render :edit
    end
  end

end

private

def set_device
  @device = Device.find(params[:id])
end