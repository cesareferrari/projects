require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "projects are ordered by priority" do
    project_one = projects(:one) # from fixtures
    project_two = projects(:two)
    project_three = projects(:three)

    sort_order = [project_two.id, project_one.id, project_three.id]

    projects = Project.todo

    sorted_projects = projects.map { |p| p.id }

    assert sort_order, sorted_projects
  end
end
