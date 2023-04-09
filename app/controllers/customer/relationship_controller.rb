class Customer::RelationshipController < ApplicationController
  before_action :authenticate_user!
  
  def create
    user = Customer.find(params[:customer_id])
    current_customer.follow(@user)
    redirect_to request.referer
  end
  
  def destroy
    user = Customer.find(params[:customer_id])
    current_customer.unfollow(user)
    redirect_to request.referer
  end
  
  def followings
    user = Customer.find(params[:customer_id])
    @users = user.followings
  end
  
  def followers
    user = Customer.find(params[:customer_id])
    @users = user.followers
  end
    
end
