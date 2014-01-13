class TablesController < ApplicationController

  def index
    @tables = Table.all.order('masa_no ASC')
  end

  def new
    @tables = Table.new
  end
  def edit
    @tables = Table.find(params[:id])
  end

  def update
    @tables = Table.find(params[:id])

    if @tables.update(params[:table].permit(:masa_no ))
      redirect_to tables_path
    else
      render 'edit'
    end
  end

  def destroy
    @tables = Table.find(params[:id])
    @tables.destroy

    redirect_to tables_path
  end

  def create
    @tables = Table.new(order_params)
    @tables.save
    redirect_to tables_path
  end

  def show
    @tables = Table.find(params[:id])
  end

  private
  def order_params
    params.require(:table).permit(:masa_no )
  end

end
