class Customer::UsersController < ApplicationController
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
   @customer = current_customer
  end

  def update
   @customer = current_customer
   if @customer.update(customer_params)
    redirect_to user_mypage_path
   else
    render :edit
   end
  end

  private
  def customer_params
   params.require(:customer).permit(:name,:profile_image)
  end
end
