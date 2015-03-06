class DeliveryService
  def get_orders_to_deliver
    order_model.includes(:status).where(statuses: {label: %w(is_new is_paid) })
  end

  def get_address_for_orders(orders_id)
    order_model.find(orders_id).map { |order| order.address}
  end

  def set_order_delivered(order_id)
    status_id = status_modal.find_by_label('is_delivered').id
    order_model.find(order_id).update(status_id: status_id)
  end

  private
  def order_model
    Order
  end
  def status_modal
    Status
  end
end