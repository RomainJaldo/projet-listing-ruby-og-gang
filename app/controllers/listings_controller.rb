class ListingsController < ApplicationController

  #before_action :authentificate_user!, except =>[:index]

  def index
    @listing = Post.all.order('created_at DESC')
  end

  def new
    @listing = Post.new
  end

  def create

  end

end
