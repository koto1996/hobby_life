class Customer::PostsController < ApplicationController
  before_action :authenticate_customer!,except:[:index]
  def new
    @post = Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.customer_id=current_customer.id
    @post.save
    data = Vision.get_image_data(@post.image)
   if data.value?("LIKELY") || data.value?("VERY_LIKELY")
    @post.image.purge
    @post.destroy
    redirect_to new_post_path,notice:"投稿に失敗しました"
   else
    redirect_to post_path(@post),notice:"投稿に成功しました。"
   end
  end

  def index
    @posts=Post.all.order(created_at: :desc)
  end

  def show
    @post=Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path,notice:'投稿を削除しました。'
  end

  private

  def post_params
    params.require(:post).permit(:title,:body,:customer_id,:hobby_id,:image)
  end

end
