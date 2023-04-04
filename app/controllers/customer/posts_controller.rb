class Customer::PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post=Post.new(post_params)
    @post.customer_id=current_customer.id
   if
    @post.save
    redirect_to customer_posts_path
   else
    render request.referer
   end
  end
   
  def index
    @posts=Post.all
  end

  def show
    @post=Post.find(params[:id])
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title,:body,:customer_id,:hobby_id,:image)
  end
  
end
