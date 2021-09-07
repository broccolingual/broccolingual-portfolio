class BlogsController < ApplicationController
  before_action :if_admin, only: [:new, :create, :edit, :update, :destroy]

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save 
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to root_path
  end

  private

  def if_admin
    redirect_to root_path unless current_user.admin?
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
