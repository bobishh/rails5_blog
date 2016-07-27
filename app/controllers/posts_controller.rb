# CRUD Posts controller
class PostsController < ApplicationController
  before_action :fetch_post, only: [:show, :edit, :update]
  before_action :require_login, only: [:edit, :new]

  def new
    @post = Post.new
  end

  def index
    @posts = PostPresenter.decorate_all(Post.all)
  end

  def show
    @post = PostPresenter.decorate(@post)
  end

  def update
    if @post.update(@post.params)
      redirect_to @post
    else
      render 'edit', post: @post
    end
  end

  def create
    @post = Post.create(post_params)
    if @post.persisted?
      redirect_to @post
    else
      render 'new', post: @post
    end
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit!
  end

  def fetch_post
    @post = Post.find(params[:id])
  end
end
