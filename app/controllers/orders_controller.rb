class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :direction]
  before_action :authenticate_user!
  before_action :is_delivery, only: [:direction]

  # GET /orders
  # GET /orders.json
  def index
    if current_user.is_delivery_man?
      @orders = Order.all
    else
      @orders = Order.where(user_id: current_user.id)
    end
  end

  # GET /orders/1/direction
  def direction
    @destination = @order.address
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.create(order_params)
    @order.user_id = current_user.id

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    order_params[:user_id] = current_user.id
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:date, :zip_code, :city, :street, :number)
    end

    def is_delivery
      unless current_user.is_delivery_man?
        redirect_to :back, :alert => "Access denied."
      end
    end
end
