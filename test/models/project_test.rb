require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  def setup
    @user = users(:cesare)
  end

  test "projects are ordered by priority" do
    project_one = projects(:one) # from fixtures
    project_two = projects(:two)
    project_three = projects(:three)
    project_four = @user.projects.create!(name: "Four", priority: 1)

    sort_order = [project_four, project_two, project_one, project_three] 

    projects = Project.todo

    assert_equal sort_order, projects
  end

  test '#todo' do
    assert_includes Project.todo, projects(:one)
    refute_includes Project.todo, projects(:done_project)
  end

  test '#done' do
    assert_includes Project.done, projects(:done_project)
    refute_includes Project.done, projects(:one)
  end

  test "defaults to category Administration when created without category" do
    @user.projects.create!(name: "Test")

    assert "Administration", Project.last.category.name
  end

  test "has an assigned category when created" do
    category = categories(:work)
    @user.projects.create!(name: "Test", category: category)

    assert "Work", Project.last.category.name
  end
end
