module TravelDayReimbursement
  def travel_cost_for_one_project(project)
    if !current_project_start_and_end_date_equal?(project)
      cost = 2 * project.city_type[:travel_day]
    else
      cost = project.city_type[:travel_day]
    end
    return cost
  end

  def travel_cost_between_projects(project, previous_project)
    date_difference = (project.start_date - previous_project.end_date).to_i
    if (date_difference > 1)
      project.city_type[:travel_day] + previous_project.city_type[:travel_day]
    else
      0
    end
  end

  private

  def next_projects_starts_tomorrow?(project, next_project)
    return false if next_project.nil?
    (project.end_date + 1) == next_project.start_date
  end

  def current_project_start_and_end_date_equal?(project)
    project.start_date == project.end_date
  end
end
