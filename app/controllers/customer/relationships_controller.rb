class Customer::RelationshipsController < ApplicationController
 before_action :authenticate_customer!

  def create
    user = Customer.find(params[:user_id])
    current_customer.follow(user)
    redirect_to request.referer
  end

  def destroy
    user = Customer.find(params[:user_id])
    current_customer.unfollow(user)
    redirect_to request.referer
  end

  def followings
    user = Customer.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = Customer.find(params[:user_id])
    @users = user.followers
  end

end
