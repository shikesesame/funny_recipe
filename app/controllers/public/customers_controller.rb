class Public::CustomersController < ApplicationController
  def index
    @customer = Customer.new
    @customers = Customer.all
    @recipe = Recipe.new
    @customer = current_customer
  end

  def show
    @customer = Customer.find(params[:id])
    @recipes = @customer.recipes
    @recipe = Recipe.new
  end

  def edit
    @customer = Customer.find(params[:id])
    @recipes = @customer.recipes
    if @customer == current_customer
      render :edit
    else
      redirect_to public_customer_path(@customer.id)
    end
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "正常に更新されました"
      redirect_to public_customer_path(@customer.id)
    else
      render :edit
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:name, :body, :image,)
  end

end
