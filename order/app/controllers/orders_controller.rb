class OrdersController < ApplicationController

  def new
    @order = Request.new
  end
  def edit
    @order = Request.find(params[:id])
  end

  def update
    @order = Request.find(params[:id])

    if @order.update(params[:order].permit(:masa_no, :order, :price))
      redirect_to orders_path
    else
      render 'edit'
    end
  end

  def destroy
    @order = Request.find(params[:id])
    @order.destroy

    redirect_to order_path(@order.masa_no)
  end

  def create
    @order = Request.new(order_params)
    @order.save
    redirect_to order_path(@order.masa_no)
  end

  def show
    @masa_no = params[:id]
    @order = Request.find_all_by_masa_no(@masa_no)
  end

  private
    def order_params
      params.require(:order).permit(:masa_no, :order, :price)
    end

end
