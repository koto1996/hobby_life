class Customer::PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post=Post.new(post_params)
    @post.customer_id=current_customer.id
   if
    @post.save
    redirect_to posts_path
   else
    render request.referer
   end
  end
   
  def index
    @posts=Post.all.order(created_at: :desc)
  end

  def show
    @post=Post.find(params[:id])
    @post_comment = PostComment.new
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title,:body,:customer_id,:hobby_id,:image)
  end
  
end
