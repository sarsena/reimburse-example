module FullDayReimbursement

  def full_days_reimbursement_cost(project, previous_project, next_project)
    full_day_cost = 0
    full_days = full_days_for(project)
    if (full_days >= 1)
      full_days = increment_full_days(full_days, project, previous_project, next_project)
    elsif(full_days == 0)
      full_days = (full_days + 1) if project_start_and_end_falls_between_projects?(project, previous_project, next_project)
    end
    full_day_cost = (project.city_type[:full_day] * full_days)
  end

  private

  def increment_full_days(full_days, project, previous_project, next_project)
    full_days = (full_days + 1) if next_projects_starts_tomorrow?(project, next_project)
    full_days = (full_days + 1) if previous_project_ended_yesterday?(project, previous_project)
    full_days = (full_days + 1) if current_project_ends_on_next_projects_start_date?(project, next_project)
    full_days
  end

  def full_days_for(project)
    full_days = (project.start_date..project.end_date).to_a
    full_days.shift #=> Removes first value
    full_days.pop #=> Removes last value
    full_days.count
  end

  def previous_project_ended_yesterday?(project, previous_project)
    return false if previous_project.nil?
    (project.start_date - 1) == previous_project.end_date
  end

  def start_and_end_on_same_day?(project)
    project.start_date == project.end_date
  end

  def current_project_ends_on_next_projects_start_date?(project, next_project)
    return false if next_project.nil?
    project.end_date == next_project.start_date
  end

  def project_start_and_end_falls_between_projects?(project, previous_project, next_project)
    start_and_end_on_same_day?(project) &&
      previous_project_ended_yesterday?(project, previous_project) &&
      current_project_ends_on_next_projects_start_date?(project, next_project)
  end
end
