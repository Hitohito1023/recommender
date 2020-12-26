class HomeController < ApplicationController

  def top
  end

  def about
  end

  def ranking
    @post_items = PostItem.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @users = User.includes(:favorites_post_items).sort {|a,b| b.favorites_post_items.size <=> a.favorites_post_items.size}
  end
end

