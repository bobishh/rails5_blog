# CRUD Posts controller
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params.id)
  end

  def update
  end

  def create
  end

  def edit
  end
end
