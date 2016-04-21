require 'test_helper'

class ComputersControllerTest < ActionController::TestCase
  def setup
    @computer = Computer.new(name: "test_computer")
    @computer.save
  end

  test "should get show" do
    get :show, :id => @computer.id
    assert_response :success
  end
end
