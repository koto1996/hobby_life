class Customer::GroupsController < ApplicationController
  before_action :authenticate_customer!
  before_action :is_matching_login_customer,only:[:edit,:update]
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_customer.id
    if @group.save
     redirect_to groups_path,notice:'グループを作成しました。'
    else
     redirect_to new_group_path,notice:'グループの作成に失敗しました'
    end
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    is_matching_login_customer
    @group = Group.find(params[:id])
  end

  def update
    is_matching_login_customer
    @group=Group.find(params[:id])
    if @group.update(group_params)
     redirect_to groups_path,notice:'グループを編集しました'
    else
     render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to groups_path, notice:'グループを削除しました'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name,:introduction, :image)
  end

  def is_matching_login_customer
    group_id = Group.find(params[:id])
    unless group_id.owner.id == current_customer.id
      redirect_to groups_path
  end
  end
end
