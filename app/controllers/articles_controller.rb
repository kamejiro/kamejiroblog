class ArticlesController < ApplicationController

  def show
    @nav=Category.take(4)
    @article=Article.find(params[:id])
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
    @article.increment_impression
  end

  def new
    @nav=Category.take(4)
    @categorys=Category.all
    @article=Article.new
  end

  def create
    @nav=Category.take(4)
    @categorys=Category.all
    if article_params[:category_id] != ""
      @category=Category.find(article_params[:category_id])
      @article=@category.articles.build(article_params)
      if @article.save
        #フラッシュとリダイレクト
        flash[:success]="article created"
        redirect_to root_url
      else
        render 'new'
      end
    else
      redirect_to new_url
    end
  end

  def index
    @nav=Category.take(4)
    @articles=Article.paginate(page: params[:page], per_page: 10).order(created_at: 'DESC')
  end

  def destroy
    @article=Article.find(params[:id]).destroy
    flash[:success]="User deleted"
    redirect_to articles_url
  end


  private
  def article_params
    params.require(:article).permit(:title, :abstract, :category_id, :content)
  end
end
