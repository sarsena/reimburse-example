class Project
  attr_reader :start_date, :end_date, :city_type

  LOW_COST_CITY = {
    travel_day: 45,
    full_day: 75
  }

  HIGH_COST_CITY = {
    travel_day: 55,
    full_day: 85
  }

  def initialize(start_date, end_date, city_type)
    @start_date = start_date
    @end_date = end_date
    @city_type = city_type
  end
end

