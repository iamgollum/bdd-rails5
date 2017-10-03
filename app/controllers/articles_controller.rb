class ArticlesController < ApplicationController
  def index
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path # flash waits for redirect
    else
      flash.now[:danger] = "Article has not been created"
      render :new # flash is waiting in queue until new page is rendered, hence it lingers
    end
  end
  
  private 
  
  def article_params
      params.require(:article).permit(:title, :body)
  end
end
