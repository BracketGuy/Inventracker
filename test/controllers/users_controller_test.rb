require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get create" do
    get :create, {first_name: "Marcus", last_name: "McDuffie"}
    assert_response :redirect
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
