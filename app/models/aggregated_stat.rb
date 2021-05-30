class AggregatedStat < ApplicationRecord
  belongs_to :device

  enum measurement: %i[humidity light temperature]
end
