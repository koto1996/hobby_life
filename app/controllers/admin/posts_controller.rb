class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment= PostComment.all.order(created_at: :desc)
  end

  def destroy
    post=Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end
end
