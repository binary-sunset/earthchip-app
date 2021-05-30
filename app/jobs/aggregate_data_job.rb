class AggregateDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    hi = Statistics::AggregateData.call.result
    p hi
  end
end
