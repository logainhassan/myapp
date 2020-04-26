

class ArticlesController < ApplicationController
	# load_and_authorize_resource 
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  before_action :authenticate_user!, except: [:index,:show]
 	def index
    	@articles = Article.all
  	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = current_user.articles.build
		authorize! :new, @article
	end

	def edit
	  @article = Article.find(params[:id])
	  authorize! :edit, @article
	end

	def create
	  @article = current_user.articles.build(article_params)
	 	authorize! :create, @article
	  if @article.save
	    redirect_to @article
	  else
	    render 'new'
	  end

	end

	def update
	  @article = Article.find(params[:id])
	 authorize! :update, @article
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end


	def destroy
	  @article = Article.find(params[:id])
	  authorize! :destroy, @article
	  @article.destroy
	 
	  redirect_to articles_path
	end
	 
private
  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end

end