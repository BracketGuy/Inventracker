require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should create full name from first name and last name" do
    user = User.new first_name: "Marcus", last_name: "McDuffie"
    user.save
    assert user.full_name == "Marcus McDuffie", "Did not create full_name"
  end
end
