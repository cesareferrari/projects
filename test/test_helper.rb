ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def login(user, password)
    visit new_session_url
    fill_in "Email", with: user.email
    fill_in "Password", with: password
    click_button "Sign in"
    sleep(inspection_time=4) # if I don't add sleep it seems to go too fast.
  end
end
