class ListingsController < ApplicationController

  #before_action :authentificate_user!, except =>[:index]

  def index
    @posts = Post.search(params[:query])
    if @posts.blank?
      @posts = Post.all.order('created_at DESC')
    end
  end

  def new
      redirect_to new_user_registration_path unless current_user
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
      :image,
      :price).merge(user_id: current_user.id)
  end

end
