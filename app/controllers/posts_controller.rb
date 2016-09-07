# CRUD Posts controller
class PostsController < ApplicationController
  before_action :require_login, only: [:edit, :new]

  def new
    form Post::Create
  end

  def index
    @posts = PostPresenter.decorate_all(Post.all)
  end

  def show
    binding.pry
    present Post::Show
  end

  def update
    run Post::Update do |op|
      redirect_to op.model
    end

    form Post::Create
  end

  def create
    run Post::Create do |op|
      redirect_to op.model
    end

    form Post::Create
  end

  def edit
    form Post::Update
  end
end
