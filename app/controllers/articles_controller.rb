class ArticlesController < ApplicationController
  def index
    @articles = Article.all
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
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:success] = "Article has been updated"
      redirect_to @article # rails is smart enouph to redirect to particular article page
    else
      flash.now[:danger] = "Article has not been updated"
      render :new # flash is waiting in queue until new page is rendered, hence it lingers
    end
  end
  
  protected
  
    def resource_not_found
      message = "The article you are looking for could not be found"
      flash[:alert] = message
      redirect_to root_path
    end
  
  private
  
    def article_params
        params.require(:article).permit(:title, :body)
    end
end
