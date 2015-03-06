class DeliveryService
  def get_orders_to_deliver
    external_order_service.to_deliver
  end

  def get_address_for_orders(orders_id)
    external_order_service.find(orders_id).map { |order| order.address}
  end

  def set_order_delivered(order_id)
    external_order_service.find(order_id).update(is_delivered: true)
  end

  private
  def external_order_service
    Order
  end
end