class Api::V1::BlogsController < ApplicationController
  before_action :find_blog, only: [:update, :destroy]
  def index
    @blogs = Blog.all
    render json: @blogs
  end

  def create
    @blog = Blog.create(blog_params)
    render json: @blog
  end

  def update
    @blog.update(blog_params)
    if @blog.save
      render json: @blog
    else
      render json: {errors: @blog.errors.full_messages}
    end
  end

  def destroy
    @blogs = Blog.all
    @blog.destroy
    render json: @blogs
  end

  private
  def blog_params
    params.require(:blog).permit(:date, :amount_completed, :url, :week_id)
  end

  def find_blog
    @blog = Blog.find(params[:id])
  end
end
