require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = FactoryGirl.create(:project)
  end

  test "should get index" do
    get :index
    assert_response :success, @response.body
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { builder_id: @project.builder_id, latitude: @project.latitude, longitude: @project.longitude, name: 'unique name', title: 'Unique Title', verified: true }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
