require 'test_helper'

class RightsControllerTest < ActionController::TestCase
  setup do
    @right = rights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create right" do
    assert_difference('Right.count') do
      post :create, right: { file_id: @right.file_id, group_id: @right.group_id, right_r: @right.right_r, right_w: @right.right_w, right_wr: @right.right_wr, user_id: @right.user_id }
    end

    assert_redirected_to right_path(assigns(:right))
  end

  test "should show right" do
    get :show, id: @right
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @right
    assert_response :success
  end

  test "should update right" do
    patch :update, id: @right, right: { file_id: @right.file_id, group_id: @right.group_id, right_r: @right.right_r, right_w: @right.right_w, right_wr: @right.right_wr, user_id: @right.user_id }
    assert_redirected_to right_path(assigns(:right))
  end

  test "should destroy right" do
    assert_difference('Right.count', -1) do
      delete :destroy, id: @right
    end

    assert_redirected_to rights_path
  end
end
