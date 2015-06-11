require 'test_helper'

class DatasourcesControllerTest < ActionController::TestCase
  setup do
    @datasource = datasources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datasources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create datasource" do
    assert_difference('Datasource.count') do
      post :create, datasource: { name: 'unique name', title: 'Unique Title' }
    end

    assert_redirected_to datasource_path(assigns(:datasource))
  end

  test "should show datasource" do
    get :show, id: @datasource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @datasource
    assert_response :success
  end

  test "should destroy datasource" do
    assert_difference('Datasource.count', -1) do
      delete :destroy, id: @datasource
    end

    assert_redirected_to datasources_path
  end
end
