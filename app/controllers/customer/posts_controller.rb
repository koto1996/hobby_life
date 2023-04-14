class Customer::PostsController < ApplicationController
  before_action :authenticate_customer!,except:[:index]
  def new
    @post = Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.customer_id=current_customer.id
   if
    @post.save
    redirect_to posts_path,notice:"投稿に成功しました。"
   else
    redirect_to request.referer,notice:"投稿に失敗しました"
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
    redirect_to request.referer,notice:'投稿を削除しました。'
  end

  private

  def post_params
    params.require(:post).permit(:title,:body,:customer_id,:hobby_id,:image)
  end

end
