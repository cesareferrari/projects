require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  setup do
    @user = users(:cesare) # from fixtures
    login(@user, 'secret')
    @project = @user.projects.create!(name: "Develop new website")
  end

  test "creating a new activity" do
    visit project_url(@project)
    click_on "Add activity"

    # fill_in_trix_editor "activity_content", with: "Create UI design"
    find('trix-editor').click.set('Create UI design')

    assert_selector "h1", text: @project.name
    click_on "Create activity"
    assert_selector "h1", text: @project.name
    assert_text "Create UI design"
  end

  test "activity can be set to next" do
    activity_one = @project.activities.create!(content: "first activity")
    activity_two = @project.activities.create!(content: "second activity")

    refute activity_one.next?

    visit project_url(@project)

    assert_selector "h1", text: "Develop new website"

    within "#activity-#{activity_one.id}" do
      click_on "make-next"
    end

    sleep(inspection_time=5)
    # Adding sleep so it stops for a while.
    # Without this the next assertion won't pass: activity_one.next would
    # be false. Probably because it goes too fast.
    # I could also add binding.pry, and it would stop the browser, so I can see
    # that it's actually setting it to next.

    assert activity_one.reload.next?
  end
end
