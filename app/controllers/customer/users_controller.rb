class Customer::UsersController < ApplicationController
  def show
   @customer = current_customer
  end

  def edit
  end

  private
  def customer_params
   params.require(:customer).permit(:name,:profile_image)
  end
end
