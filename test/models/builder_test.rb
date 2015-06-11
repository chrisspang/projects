require 'test_helper'

class BuilderTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:title)

  should validate_uniqueness_of(:name)
  should validate_uniqueness_of(:title)
end
