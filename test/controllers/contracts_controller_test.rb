require 'test_helper'

class ContractsControllerTest < ActionController::TestCase
  test "should get listing-agreement" do
    get :listing-agreement
    assert_response :success
  end

end
