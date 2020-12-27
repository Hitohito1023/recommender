class HomeController < ApplicationController

  def top

  end

  def about

  end

  def ranking
    @post_items = PostItem.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @users = User.includes(:post_items).sort {|a,b| b.post_items.size <=> a.post_items.size}
    # @followers = User.includes(:followers).sort {|a,b| b.followers.size <=> a.followers.size}
    @user_followers = User.includes(:followers).sort {|a,b| b.followers.size <=> a.followers.size}

  end

end

