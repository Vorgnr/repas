class DeliveryController < ApplicationController
  def initialize
    @delivery = DeliveryService.new
  end

  soap_service namespace: 'urn:Delivery'

  soap_action "get_orders_to_deliver",
    :return => { :orders =>[Order] }
  def get_orders_to_deliver
    render :soap => { :orders => @delivery.get_orders_to_deliver.map { |offer| offer.attributes } }
  end

  soap_action "get_address_for_orders",
    :args => { :orders_id => [:integer] },
    :return => [:string]
  def get_address_for_orders
    orders_id = params[:orders_id]
    render :soap => @delivery.get_address_for_orders(orders_id)
  end

  soap_action "set_order_delivered",
    :args => { :order_id => :integer },
    :return => :boolean
  def set_order_delivered
    order_id = params[:order_id]
    render :soap => @delivery.set_order_delivered(order_id)
  end
end
