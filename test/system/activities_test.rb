require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit activities_url
  #
  #   assert_selector "h1", text: "Activities"
  # end


  # Create a project
  # create 2 activities
  # view the project show page
  # click on "make next" on one activity
  # verify that the activity.next is true

  # test "activity can be set to next" do
  #   user = users(:cesare) # from fixtures

  #   project = user.projects.create!(name: "Develop new website")
  #   activity_one = project.activities.create!(content: "first activity")
  #   activity_two = project.activities.create!(content: "second activity")


  #   visit new_session_url
  #   fill_in "Email", with: "cesare@hey.com"
  #   fill_in "Password", with: "secret"
  #   click_button "Sign in"

  #   visit project_url(project)

  #   assert_selector "h1", text: "Develop new website"

  #   within "activity-#{activity_one.id}" do
  #     click_on "Make next"
  #   end

  #   assert activity_one.next
  # end
end
