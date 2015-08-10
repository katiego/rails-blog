class PostsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  # show ALL recipes in db
  def index
    @posts = Post.all
    render :index
  end

  # form to create new recipe
  def new
    @post = Post.new
    render :new
  end

  # creates new recipe in db
  # that BELONGS TO current_user
  def create
    # recipe = Recipe.create(recipe_params)
    # current_user.recipes << recipe
    
    post = current_user.posts.create(post_params)
    redirect_to post_path(post)
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  # show form to edit one recipe
  def edit
    @post = Post.find(params[:id])
    if current_user.posts.include? @post
      render :edit
    else
      # redirect_to '/profile'
      redirect_to profile_path
    end
  end

  def update
    post = Post.find(params[:id])
    if current_user.posts.include? post
      post.update_attributes(post_params)
      redirect_to post_path(post)
    else
      redirect_to profile_path
    end
  end

  def destroy
    # find recipe first
    # also check current_user!
    # recipe.destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end

