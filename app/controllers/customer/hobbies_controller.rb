class Customer::HobbiesController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer,only:[:edit,:update]
  def index
    @hobby = Hobby.new
    @hobbies = current_customer.hobbies
  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.customer_id=current_customer.id
    if
      @hobby.save
      redirect_to hobbies_path,notice:"hobbyを作成しました。"
    else
      redirect_to request.referer,notice:"hobbyの作成に失敗しました"
    end
  end

  def edit
    @hobby = Hobby.find(params[:id])
  end

  def update
    @hobby = Hobby.find(params[:id])
    if
      @hobby.customer_id==current_customer.id
      @hobby.update(hobby_params)
      redirect_to hobbies_path,notice:"hobbyを更新しました。"
    end
  end

  private

  def hobby_params
    params.require(:hobby).permit(:name,:customer_id)
  end

  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to user_path(customer)
    end
  end
end
