require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @order = orders(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { city: @order.city, date: @order.date, is_payed: @order.is_payed, number: @order.number, street: @order.street, total_price: @order.total_price, user_id: @order.user_id, zip_code: @order.zip_code }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { city: @order.city, date: @order.date, is_payed: @order.is_payed, number: @order.number, street: @order.street, total_price: @order.total_price, user_id: @order.user_id, zip_code: @order.zip_code }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
