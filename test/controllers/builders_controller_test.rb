require 'test_helper'

class BuildersControllerTest < ActionController::TestCase
  setup do
    @builder = FactoryGirl.create(:builder)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:builders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create builder" do
    assert_difference('Builder.count') do
      post :create, builder: { name: 'unique name', title: 'Unique Title' }
    end

    assert_redirected_to builder_path(assigns(:builder))
  end

  test "should show builder" do
    get :show, id: @builder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @builder
    assert_response :success
  end

  test "should destroy builder" do
    assert_difference('Builder.count', -1) do
      delete :destroy, id: @builder
    end

    assert_redirected_to builders_path
  end
end
