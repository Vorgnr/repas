require 'test_helper'

class DeliveryServiceTest < ActiveSupport::TestCase
  setup do
    @delivery_service = DeliveryService.new
  end

  test "get_orders_to_deliver should return not already delivered orders" do
    actual = @delivery_service.get_orders_to_deliver
    expected = [orders(:one), orders(:two)]
    assert_equal expected, actual
  end

  test "get_address_for_orders should each order address" do
    actual = @delivery_service.get_address_for_orders [orders(:one).id, orders(:two).id]
    expected = [orders(:one).address, orders(:two).address]
    assert_equal expected, actual
  end

  test "set_order_delivered should update status accordingly" do
    @delivery_service.set_order_delivered(orders(:one).id)
    expected = Order.find(orders(:one).id).is_delivered
    assert expected
  end
end