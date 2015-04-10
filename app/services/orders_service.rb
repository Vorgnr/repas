class OrdersService
  def create_order(order_params)
    is_new_status_id = status_model.find_by_label('is_new').id
    order_params[:status_id] = is_new_status_id
    order = order_model.create(order_params)
    order.save
  end

  def pay_order(order_id)
    is_paid_status_id = status_model.find_by_label('is_paid').id
    order_model.find(order_id).update(status_id: is_paid_status_id)
  end

  def deliver_order(order_id)
    is_delivered_status_id = status_model.find_by_label('is_delivered').id
    order_model.find(order_id).update(status_id: is_delivered_status_id)
  end

  def cash_order(order_id)
    is_cash_status_id = status_model.find_by_label('is_cashed').id
    order_model.find(order_id).update(status_id: is_cash_status_id)
  end

  private
  def order_model
    Order
  end
  def status_model
    Status
  end
end