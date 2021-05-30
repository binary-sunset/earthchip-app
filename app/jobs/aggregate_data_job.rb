class AggregateDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Statistics::AggregateData.call
  end
end
