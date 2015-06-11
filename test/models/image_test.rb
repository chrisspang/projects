require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  should validate_presence_of(:url)
  
  should belong_to(:blurb)
end
