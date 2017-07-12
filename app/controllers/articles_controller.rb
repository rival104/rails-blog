class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.all # @artilcles can be named anything.
  end
  
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect
    # debugger
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article was succesfully created"
      redirect_to article_path(@article)
    else
      render 'new'#:new will also work
    end
  end
  
  def show
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "Article succesfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def edit
  end
  
  def destroy
    @article.destroy
    flash[:info] = "Article succesfully deleted"
    redirect_to articles_path
  end
  
  private
  def set_article
     @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end
end