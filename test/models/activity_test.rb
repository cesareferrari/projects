require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  test "has next attribute set to false when created" do
    activity = Activity.new
    refute activity.next
  end
end
