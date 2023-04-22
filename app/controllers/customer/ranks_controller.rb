class Customer::RanksController < ApplicationController

  def rank
    @post_like_ranks = Post.find(Favorite.group(:post_id).where(created_at: Time.current.all_month).order('count(post_id) desc').pluck(:post_id))
  end
end
