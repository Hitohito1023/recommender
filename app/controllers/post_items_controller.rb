class PostItemsController < ApplicationController
  def index
    @post_items = PostItem.all
  end

  def show
  end

  def new
    @post_item = PostItem.new
  end

  def create
    @post_item = PostItem.new(post_item_params)
    @post_item.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def complete
  end
end
