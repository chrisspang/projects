require 'test_helper'

class BlurbsControllerTest < ActionController::TestCase
  setup do
    @blurb = blurbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blurbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blurb" do
    assert_difference('Blurb.count') do
      post :create, blurb: { datasource_id: 2, project_id: 1, description: 'Unique description' }
    end

    assert_response :redirect
    assert_match project_path(@blurb.project), @response.redirect_url
#    assert_redirected_to blurb_path(assigns(:blurb))
#    assert_redirected_to project_path(@blurb.project)
  end

  test "should show blurb" do
    get :show, id: @blurb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blurb
    assert_response :success
  end

  test "should update blurb" do
    patch :update, id: @blurb, blurb: { datasource_id: @blurb.datasource_id, description: @blurb.description }
#    assert_redirected_to project_path(assigns(:blurb))
    assert_redirected_to project_path(@blurb.project, :blurb_id => @blurb.id)    
  end

  test "should destroy blurb" do
    assert_difference('Blurb.count', -1) do
      delete :destroy, id: @blurb
    end

    assert_redirected_to project_path(@blurb.project)
  end
end
