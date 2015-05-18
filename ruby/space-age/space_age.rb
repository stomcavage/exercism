class SpaceAge
  SECS_IN_EARTH_YEAR = 31557600.0

  RELATIVE_YEARS = {
    "mercury" =>   0.2408467,
    "venus"   =>   0.61519726,
    "earth"   =>   1.0,
    "mars"    =>   1.8808158,
    "jupiter" =>  11.862615,
    "saturn"  =>  29.447498,
    "uranus"  =>  84.016846,
    "neptune" => 164.79132
  }

  attr_reader :seconds

  def initialize(age_in_secs)
    @seconds = age_in_secs.to_f
  end

  def method_missing(name, *args)
    return super unless name.match(/^on_(\w+)$/)
    if RELATIVE_YEARS.key?($1)
      age = @seconds / (RELATIVE_YEARS[$1] * SECS_IN_EARTH_YEAR)
      age.round(2)
    else
      return super
    end
  end
end

