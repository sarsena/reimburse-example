require 'rubygems'
require 'bundler/setup'
require 'time'
Bundler.require(:default)

require_all 'models'

project_group_one = [
  Project.new(Date.new(2015, 9, 1), Date.new(2015, 9, 3), Project::LOW_COST_CITY)
]

project_group_two = [
  Project.new(Date.new(2015, 9, 1), Date.new(2015, 9, 1), Project::LOW_COST_CITY),
  Project.new(Date.new(2015, 9, 2), Date.new(2015, 9, 6), Project::HIGH_COST_CITY),
  Project.new(Date.new(2015, 9, 6), Date.new(2015, 9, 8), Project::LOW_COST_CITY)
]

project_group_three = [
  Project.new(Date.new(2015, 9, 1), Date.new(2015, 9, 3), Project::LOW_COST_CITY),
  Project.new(Date.new(2015, 9, 5), Date.new(2015, 9, 7), Project::HIGH_COST_CITY),
  Project.new(Date.new(2015, 9, 8), Date.new(2015, 9, 8), Project::HIGH_COST_CITY)
]

project_group_four = [
  Project.new(Date.new(2015, 9, 1), Date.new(2015, 9, 1), Project::LOW_COST_CITY),
  Project.new(Date.new(2015, 9, 1), Date.new(2015, 9, 1), Project::LOW_COST_CITY),
  Project.new(Date.new(2015, 9, 2), Date.new(2015, 9, 2), Project::HIGH_COST_CITY),
  Project.new(Date.new(2015, 9, 2), Date.new(2015, 9, 3), Project::HIGH_COST_CITY)
]
