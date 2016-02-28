require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get _nav" do
    get :_nav
    assert_response :success
  end

end
