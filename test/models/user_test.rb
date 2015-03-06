require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should have a method is_delivery_man" do
    assert users(:delivery_man).is_delivery_man?
  end
end
