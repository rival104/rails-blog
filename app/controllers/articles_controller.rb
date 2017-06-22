class ArticlesController < ApplicationController
  def index
    @articles = Article.all # @artilcles can be named anything.
  end
  
  def new
    @article = Article.new
  end
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was succesfully created"
      redirect_to article_path(@article)
    else
      render 'new'#:new will also work
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      flash[:notice] = "Article succesfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end