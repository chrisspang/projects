require 'test_helper'

class BlurbTest < ActiveSupport::TestCase

  should validate_presence_of(:description)
  
  should belong_to(:project)
  should belong_to(:datasource)

  should have_many(:images)
  
  test "valid fixture" do
    b = blurbs(:one)
    assert b.valid?, "Valid fixture :one"
  end

  test "invalid without description" do
    b = blurbs(:one)
    b.description = nil
    assert !b.valid?, "Not valid without a description" + b.errors.full_messages.inspect
  end
  
end
