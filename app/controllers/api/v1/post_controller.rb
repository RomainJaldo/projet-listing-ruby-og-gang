class Api::V1::PostController < Api::V1::ApiController

  protect_from_forgery with: :null_session

  before_action :auth_with_token

  def index
    render :json => {content: Post.all}
  end

  def create
    current_listing = params[:payload]

  Post.create!(
    {
      author: current_listing[:email],
      name: current_listing[:title],
      photo: current_listing[:description],
      description: current_listing[:price],
      price: current_listing[:price],
      tags: current_listing[:tags].split(';'),
      date: DateTime.now
    })
    render :json => { message: "Post successfully created" }
  end
end
