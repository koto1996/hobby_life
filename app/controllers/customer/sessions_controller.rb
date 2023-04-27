# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # before_action :customer_state, only:[:create]
  # customer.rbに記載
  def new_guest
    customer = Customer.guest
    sign_in customer
    redirect_to posts_path, notice: 'ゲストとしてログイン'
  end
  # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  # 退会しているか判断するメソッド
  # def customer_state
  #   # emailが一致しているアカウントを取得する
  #   @customer = Customer.find_by(email: params[:customer][:email])
  # return if !@customer
  #   if @customer.valid_password?(params[:customer][:password])
  #     @customer.active_for_authentication == false
  #   else
  #     @customer.is_withdraw
  #   end
  # end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
