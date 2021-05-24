class DeviceController < ApplicationController
  def index
    @devices = Device.all
  end

  def edit
  end

  def update
  end
end
