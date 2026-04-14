class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :set_students, only: [:new, :edit, :create, :update]

  # GET /blogs
  def index
    @blogs = Blog.includes(:student).all
  end

  # GET /blogs/:id
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path, notice: "Blog was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /blogs/:id/edit
  def edit
  end

  # PATCH/PUT /blogs/:id
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "Blog was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/:id
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "Blog was successfully deleted."
  end

  private

  # callback for finding blog
  def set_blog
    @blog = Blog.find(params[:id])
  end

  # callback for dropdown students
  def set_students
    @students = Student.all
  end

  # strong params
  def blog_params
    params.require(:blog).permit(:title, :description, :student_id)
  end
end