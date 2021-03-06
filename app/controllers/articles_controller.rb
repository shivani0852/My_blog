class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
   # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show] 
  # layout "inventory", except: [:index]
    # layout Proc.new { |controller| controller.request.xhr? ? "application" : "inventory" }
    
  def index
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def search
    if params[:search].blank?
      redirect_to(articles_path, alert: "Empty field!") and return
    else
      keyword = params[:search]
      @articles = Article.where("title LIKE ?", "%#{keyword}%")
    end
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)
    # @article = Article.new(article_params)

    if @article.save
      respond_to do |format|
        format.html { redirect_to @article, notice: 'Article was successfully created' }
        format.js
      end  
    else
      render 'new', layout: "new_layout"
    end
  end

  def update
    if @article.update(article_params)
      respond_to do |format|
        format.html { redirect_to @article, notice: 'Article was successfully updated' }
        # format.js
      end
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      # format.html { redirect_to articles_path, notice: 'Article was successfully destroyed'}
      format.js {}
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, images: [])
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
