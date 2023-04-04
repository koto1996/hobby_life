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
  end

  def show
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title,:body,:customer_id)
  end
  
end
