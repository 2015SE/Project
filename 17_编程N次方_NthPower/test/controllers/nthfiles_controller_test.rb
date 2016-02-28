require 'test_helper'

class NthfilesControllerTest < ActionController::TestCase
  setup do
    @nthfile = nthfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nthfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nthfile" do
    assert_difference('Nthfile.count') do
      post :create, nthfile: { count: @nthfile.count, filesize: @nthfile.filesize, rename: @nthfile.rename, resize: @nthfile.resize }
    end

    assert_redirected_to nthfile_path(assigns(:nthfile))
  end

  test "should show nthfile" do
    get :show, id: @nthfile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nthfile
    assert_response :success
  end

  test "should update nthfile" do
    patch :update, id: @nthfile, nthfile: { count: @nthfile.count, filesize: @nthfile.filesize, rename: @nthfile.rename, resize: @nthfile.resize }
    assert_redirected_to nthfile_path(assigns(:nthfile))
  end

  test "should destroy nthfile" do
    assert_difference('Nthfile.count', -1) do
      delete :destroy, id: @nthfile
    end

    assert_redirected_to nthfiles_path
  end
end
