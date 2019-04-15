class ListingsController < ApplicationController

  #before_action :authentificate_user!, except =>[:index]

  def index
    @posts = Post.search(params[:query])
    if @posts.blank?
      @posts = Post.all.order('created_at DESC')
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to listings_en_path
    else
      redirect_to new_listing_en_path
    end
  end

  private

  def posts_params
    params.require(:post)
    .permit(
      :category_id,
      :title,
      :description,
      :price).merge(user_id: 1)
  end

end
