require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @user = users(:cesare)
    login(@user, 'secret')
  end

  test "assign category to project" do

    visit projects_url
    click_on "New project", match: :first
    fill_in "Name", with: "Test project"
    select "Work", from: "Category"
    click_on "Create project"

    sleep(4)

    assert "Work", Project.last.category.name
  end
end
