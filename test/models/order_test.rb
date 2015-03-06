require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = orders(:one)
  end

  test "should have a method address which return address" do
    expected = "#{@order[:zip_code]} #{@order[:city]} #{@order[:number]} #{@order[:street]}"
    assert_equal expected, @order.address
  end
end
