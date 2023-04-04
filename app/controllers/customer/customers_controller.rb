class Customer::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  private

  def customer_params
   params.require(:customer).permit(:name)
  end
end
