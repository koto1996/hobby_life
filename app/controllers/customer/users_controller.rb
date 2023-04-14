class Customer::UsersController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer,only:[:edit,:update]
  def show
   @customer = Customer.find(params[:id])
   @posts = @customer.posts.order(created_at: :desc)
   @hobbies = current_customer.hobbies
  end

  def index
   @customers = Customer.all
  end

  def like
   @customer = current_customer
   @favorite_posts = @customer.favorite_posts
  end


  def edit
   is_matching_login_customer
   @customer = Customer.find(params[:id])
  end

  def update
   is_matching_login_customer
   @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
    redirect_to user_path(@customer)
   else
    render :edit
   end
  end

  private
  def customer_params
   params.require(:customer).permit(:name,:profile_image)
  end

  def is_matching_login_customer
   customer = Customer.find(params[:id])
   unless customer.id == current_customer.id
    redirect_to user_path(customer)
   end
  end
end
