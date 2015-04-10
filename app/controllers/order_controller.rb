class OrderController < ApplicationController
  def initialize
    @order = OrdersService.new
  end

  soap_service namespace: 'urn:Orders'

  soap_action "create_order",
              :args => { :order_params => Order },
              :return => :boolean
  def create_order
    order_params = params[:order_params]
    render :soap => @order.create_order(order_params)
  end

  soap_action "pay_order",
              :args => { :order_id => :integer },
              :return => :boolean
  def pay_order
    order_id = params[:order_id]
    render :soap => @order.pay_order(order_id)
  end

  soap_action "deliver_order",
              :args => { :order_id => :integer },
              :return => :boolean
  def deliver_order
    order_id = params[:order_id]
    render :soap => @order.deliver_order(order_id)
  end

  soap_action "cash_order",
              :args => { :order_id => :integer },
              :return => :boolean
  def cash_order
    order_id = params[:order_id]
    render :soap => @order.cash_order(order_id)
  end
end
