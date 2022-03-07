require "test_helper"

class ActivityFlowTest < ActionDispatch::IntegrationTest
  # Create a project
  # create 2 activities
  # view the project show page
  # click on "make next" on one activity
  # verify that the activity.next is true

  # test "activity can be set to next" do
  #   user = users(:cesare) # from fixtures

  #   project = user.projects.create!(name: "Develop new website")
  #   activity_one = project.activities.create!(content: "first activity")
  #   # activity_two = project.activities.create!(content: "second activity")

  #   get project_path(project)

  #   # within "#activity#{activity_one.id}" do
  #   click_on "Make next"
  #   # end

  #   assert activity_one.next
  # end
end
