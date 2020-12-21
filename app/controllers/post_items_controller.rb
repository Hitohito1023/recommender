class PostItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :complete]

  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      all_post_items = @genre.post_items
    else
      all_post_items = PostItem.all
    end
    @post_items = all_post_items
    @all_post_items_count = all_post_items.count
  end

  def show
    @post_item = PostItem.find(params[:id])
    @post_comment = PostComment.new
  end

  def new
    @post_item = PostItem.new
  end

  def create
    @post_item = PostItem.new(post_item_params)
    @post_item.user_id = current_user.id
    if @post_item.save
      redirect_to post_items_complete_path, notice: "You have created book successfully."
    else
      @post_items = PostItem.all
      render 'index'
    end
  end

  def edit
    @post_item = PostItem.find(params[:id])
  end

  def update
    @post_item = PostItem.find(params[:id])
    if @post_item.update(post_item_params)
      redirect_to post_item_path(@post_item), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post_item = PostItem.find(params[:id])
    @post_item.destroy
    redirect_to post_items_path, notice: "successfully delete book!"
  end

  def complete
  end

  private

  def post_item_params
    params.require(:post_item).permit(:name, :introduction, :image, :genre_id)
  end

end
