require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest


  test "test show project" do
    project = projects(:one)
    get project_url(project)

    assert_response :success
    assert_select "h1", project.title
  end

  test "capybara test" do

    project = projects(:one)
    
    visit projects_path

    puts "Page is " + current_path

#    save_and_open_page
    
    within "div#search_form" do
      fill_in 'Search', with: 'fred'
      click_on 'search_submit'

      assert_equal root_path, projects_path
    end
  end

  test "capybara test 2" do

    project = projects(:one)
    
    visit project_path(project)

    puts "Page is " + current_path

#    save_and_open_page
    
    within "div#edit_buttons" do
      click_on 'Edit'

      assert_equal edit_project_path(project), current_path
    end
  end

end
