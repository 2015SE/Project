require 'test_helper'

class GroupFilesControllerTest < ActionController::TestCase
  setup do
    @group_file = group_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_file" do
    assert_difference('GroupFile.count') do
      post :create, group_file: { file_id: @group_file.file_id, filename: @group_file.filename, group_id: @group_file.group_id, resize: @group_file.resize }
    end

    assert_redirected_to group_file_path(assigns(:group_file))
  end

  test "should show group_file" do
    get :show, id: @group_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_file
    assert_response :success
  end

  test "should update group_file" do
    patch :update, id: @group_file, group_file: { file_id: @group_file.file_id, filename: @group_file.filename, group_id: @group_file.group_id, resize: @group_file.resize }
    assert_redirected_to group_file_path(assigns(:group_file))
  end

  test "should destroy group_file" do
    assert_difference('GroupFile.count', -1) do
      delete :destroy, id: @group_file
    end

    assert_redirected_to group_files_path
  end
end
