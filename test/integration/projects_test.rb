require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest

  test "show project" do
    project = projects(:one)
    get project_url(project)

    assert_response :success
    assert_select "h1", project.title
  end

  test "capybara test" do

    1.times { FactoryGirl.create(:project) }
#    project = projects(:one)

    project = FactoryGirl.create(:project)
    puts project.inspect
    
    visit projects_path

#    puts "Page is " + current_path
#    save_and_open_page

    within "div#search_form" do
      fill_in 'Search', with: 'project'
      click_on 'search_submit'

#      puts "Project path: #{projects_path} root: #{root_path}"
      
      assert_equal projects_path, current_path
    end
  end

  test "capybara test 2" do

    project = projects(:one)
    
    visit project_path(project)

#    puts "Page is " + current_path
#    save_and_open_page
    
    within "div#edit_buttons" do
      click_on 'Edit'

      assert_equal edit_project_path(project), current_path
    end
  end

end
