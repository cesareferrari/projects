require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:cesare) # from the fixtures
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without name' do
    @user.name = nil
    refute @user.valid?, 'user is valid without a name'
    assert_not_nil @user.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?, 'user is valid without an email'
    assert_not_nil @user.errors[:email], 'no validation error for email present'
  end

  test '#projects' do
    assert_equal 4, @user.projects.size
  end
end
