class DeliveryService
  def get_orders_to_deliver
    status = Status.find_by_label('is_paid')
    status.orders unless status.nil?
  end

  def get_address_for_orders(orders_id)
    external_order_service.find(orders_id).map { |order| order.address}
  end

  def set_order_delivered(order_id)
    status_id = external_status_service.find_by_label('is_delivered').id
    external_order_service.find(order_id).update(status_id: status_id)
  end

  private
  def external_order_service
    Order
  end
  def external_status_service
    Status
  end
end