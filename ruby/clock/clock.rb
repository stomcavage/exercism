class Clock
  MINS_PER_HOUR = 60
  MINS_PER_DAY = 24 * 60

  attr_reader :minutes

  def self.at(hour, min = 0)
    Clock.new(hour, min)
  end

  def initialize(hour, min)
    @minutes = (hour * MINS_PER_HOUR) + min
  end

  def to_s
    "%02d:%02d" % @minutes.divmod(MINS_PER_HOUR)
  end

  def +(min)
    @minutes = (@minutes + min) % MINS_PER_DAY
    self
  end

  def -(min)
    self.+(min * -1)
    @minutes += MINS_PER_DAY if @minutes < 0
    self
  end

  def ==(another_clock)
    self.minutes == another_clock.minutes
  end
end
