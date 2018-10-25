class ProjectGroup
  include TravelDayReimbursement
  include FullDayReimbursement
  attr_reader :projects

  def initialize(projects)
    @projects = projects
  end

  def total_project_reimbursement
    "$#{travel_reimbursement + full_reimbursement}"
  end

  def travel_reimbursement
    projects_travel_cost = 0
    return travel_cost_for_one_project(projects.first) if projects.length == 1
    projects.each_with_index do |project, index|
      next_project = projects[index + 1]
      previous_project = index == 0 ? nil : projects[index - 1] 
      if next_project.nil? || previous_project.nil?
        projects_travel_cost += project.city_type[:travel_day]
      else
        projects_travel_cost += travel_cost_between_projects(project, previous_project)
      end
    end
    projects_travel_cost
  end

  def full_reimbursement
    projects_full_day_cost = 0
    projects.each_with_index do |project, index|
      previous_project = projects[index-1]
      next_project = projects[index+1]
      projects_full_day_cost += full_days_reimbursement_cost(project, previous_project, next_project)
    end
    projects_full_day_cost
  end
end