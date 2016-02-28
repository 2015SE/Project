require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title","主页 | 果壳大 二手"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title","帮助 | 果壳大 二手"
  end
  
  test "should get about" do
    get :about
    assert_response :success
    assert_select "title","关于 | 果壳大 二手"
  end
  
  test "should get contact" do
    get :contact
    assert_select "title","联系我们 | 果壳大 二手"
  end

end
