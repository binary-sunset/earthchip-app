module Statistics
  class AggregateData
    include Callable

    def initialize
    end

    def call
      'Hi from statistics'
    end

  end
end