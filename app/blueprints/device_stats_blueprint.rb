class DeviceStatsBlueprint < Blueprinter::Base
  identifier :id

  fields :measurement, :created_at, :value
end