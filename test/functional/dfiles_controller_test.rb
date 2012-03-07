require 'test_helper'

class DfilesControllerTest < ActionController::TestCase
  setup do
    @dfile = dfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dfile" do
    assert_difference('Dfile.count') do
      post :create, dfile: @dfile.attributes
    end

    assert_redirected_to dfile_path(assigns(:dfile))
  end

  test "should show dfile" do
    get :show, id: @dfile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dfile.to_param
    assert_response :success
  end

  test "should update dfile" do
    put :update, id: @dfile.to_param, dfile: @dfile.attributes
    assert_redirected_to dfile_path(assigns(:dfile))
  end

  test "should destroy dfile" do
    assert_difference('Dfile.count', -1) do
      delete :destroy, id: @dfile.to_param
    end

    assert_redirected_to dfiles_path
  end
end
