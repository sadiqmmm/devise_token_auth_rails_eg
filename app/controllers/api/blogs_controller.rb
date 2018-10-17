class Api::BlogsController < Api::AuthController
  def index
    messages = Blog.includes(:user).order(created_at: :desc).page(params[:page]).per 20    
    render json: BlogListSerializer.new(blogs: blogs).generate
  end
end