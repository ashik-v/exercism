class Clock
  attr_reader :hour, :minute, :total_minutes

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
    @total_minutes = hour * 60 + minute
  end

  def to_s
    "%02d:%02d" % [normalized_hours, normalized_minutes]
  end

  def +(other_clock)
    combined_hours = hour + other_clock.hour
    combined_minutes = minute + other_clock.minute

    Clock.new(hour: combined_hours, minute: combined_minutes)
  end

  def -(other_clock)
    combined_hours = hour - other_clock.hour
    combined_minutes = minute - other_clock.minute

    Clock.new(hour: combined_hours, minute: combined_minutes)
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  private

  def normalized_hours
    (total_minutes / 60) % 24
  end

  def normalized_minutes
    total_minutes % 60
  end
end