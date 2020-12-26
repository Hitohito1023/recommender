class HomeController < ApplicationController

  def top
  end

  def about
  end

  def ranking
    @all_ranks = PostItem.find(Favorite.group(:post_item_id).order('count(post_item_id) desc').pluck(:post_item_id))
  end
end
