class ArticlesController < ApplicationController
  #http basic authentication.
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  # Defines the @articles instance variable
  def index
    @articles = Article.all 
  end

  # Defines the @article instance variable.
  def show
    @article = Article.find(params[:id]) 
  end

  # the new action instantiates a new article object, but does not save it.
  # Defines the @article instance variable.
  def new
    @article = Article.new 
  end

  #the create action instantiates a new article object and saves attempts to save it.
  def create
    # Defines the @article instance variable, article_params is a private method.
    @article = Article.new(article_params) 
    # If the article is saved successfully, redirect to the article's path.
    if @article.save # model validation. if it passes, it will save the article to the database.
      redirect_to @article
    # Otherwise, render the new template with an unprocessable entity status, which is a 422 error.
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article= Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article= Article.find(params[:id])
    @article.destroy
    redirect_to root_path, status: :see_other # 303 status code
  end

  #
  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

end
