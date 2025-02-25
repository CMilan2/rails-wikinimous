class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
    flash[:success] = "Article was successfully modified."
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other
    flash[:success] = "Article was successfully deleted."
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
    flash[:success] = "Article was successfully created."
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
