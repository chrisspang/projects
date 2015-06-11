require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:title)

  should validate_uniqueness_of(:name)
  should validate_uniqueness_of(:title)
  
  should validate_presence_of(:longitude)
  should validate_presence_of(:latitude)

  should validate_numericality_of(:longitude)
  should validate_numericality_of(:latitude)  

  should have_many(:blurbs)
  
  
  test "invalid empty project" do
    project = Project.new
    assert !project.valid?, "Empty object is invalid"
  end

end
