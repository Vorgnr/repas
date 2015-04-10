require 'test_helper'

class OrdersServiceTest < ActiveSupport::TestCase
  setup do
    @order_status_service = OrdersService.new
  end

  test "create_order should set status to is_new" do
    @order_status_service.create_order({
       total_price: 9.99,
        date: DateTime.now,
        zip_code: 31400,
        city: 'Toulouse',
        street: 'rue des cèdres',
        number: 11,
        user_id: 1
    })
    actual = Order.last.status.label
    assert_equal 'is_new', actual
  end

  test "pay_order should set status to is_paid" do
    @order_status_service.pay_order(orders(:one).id)
    actual = Order.find(orders(:one).id).status.label
    assert_equal 'is_paid', actual
  end

  test "deliver_order should set status to is_delivered" do
    @order_status_service.deliver_order(orders(:one).id)
    actual = Order.find(orders(:one).id).status.label
    assert_equal 'is_delivered', actual
  end

  test "cash_order should set status to is_cashed" do
    @order_status_service.cash_order(orders(:one).id)
    actual = Order.find(orders(:one).id).status.label
    assert_equal 'is_cashed', actual
  end
end