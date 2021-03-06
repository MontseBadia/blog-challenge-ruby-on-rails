class PostsController < ApplicationController
  before_action :require_signin, except: [:index]

  def index
    # @prompt = 'Sort by...'
    # @prompt_lang = 'Select language...'
    @posts = Post.all.page params[:page] # kaminari pagination

    @posts = @posts.language(params[:language][0..1].downcase) unless params[:language].blank?
    @posts = @posts.send(params[:sort]) unless params[:sort].blank?

    @posts = @posts.search(params[:search]) unless params[:search].blank?
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    @complete = true
    @language_detected = MagicTranslation.apply.detect @post.body
  end

  def translate
    @post = Post.find(params[:post_id])
    @translated_text = MagicTranslation.apply.translate @post.body, from: @language_detected, to: params[:locale]
  end

  def hide_translation
    @post = Post.find(params[:post_id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :language, :readable_time, :category, :image)
    end
end
