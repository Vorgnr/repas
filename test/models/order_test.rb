require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = orders(:one)
  end

  test 'should have a method address which return address' do
    expected = "#{@order[:zip_code]} #{@order[:city]} #{@order[:number]} #{@order[:street]}"
    assert_equal expected, @order.address
  end

  test 'should not save order without user' do
    @order.user_id = nil
    assert_not @order.save
  end

  test 'should not save order without city' do
    @order.city = nil
    assert_not @order.save
  end

  test 'should save order without number' do
    @order.number = nil
    assert @order.save
  end
end
