class Customer::GroupsController < ApplicationController
  before_action :authenticate_customer!
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_customer.id
    if @group.save
     redirect_to groups_path,notice:'グループを作成しました。'
    else
     render :new
    end
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
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
end
