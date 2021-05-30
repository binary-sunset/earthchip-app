module Statistics
  class AggregateData
    include Callable

    def initialize
    end

    def call
      ActiveRecord::Base.connection.execute(<<~SQL
        WITH data AS (
                       DELETE FROM device_stats RETURNING device_id, measurement, value, created_at
                     )
        INSERT INTO aggregated_stats (device_id, measurement, value, hour_at)
        SELECT device_id, measurement, ROUND( AVG(value)::numeric, 1 ) AS value, DATE_TRUNC('hour', created_at)
        FROM data
        GROUP BY measurement, device_id, DATE_TRUNC('hour', created_at);
      SQL
      )
    end

  end
end