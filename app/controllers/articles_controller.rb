class ArticlesController < ApplicationController
  before_action :check_login, only: [:create, :destroy, :index, :new, :edit, :update]
  before_action :check_admin, only: [:create, :destroy, :index, :new, :edit, :update]
  
  def show
    @nav=Category.take(4)
    @user=current_user
    @article=Article.find(params[:id])
    @rank_items=Article.private_status_public.order(impressions_count: 'DESC').take(5)
    @categorys=Category.all
    @article.increment_impression
    if @article.private_status=="private"
      check_admin
      flash[:notice]="このページは表示できません。"
    end
  end

  def new
    @user=current_user
    @nav=Category.take(4)
    @categorys=Category.all
    @category=Category.first
    if params[:id].present?
      @article_template=ArticleTemplate.find(params[:id])
    @article=Article.new(
      title: @article_template.title, 
      abstract: @article_template.abstract, 
      content: @article_template.content, 
    )
    else
      @article=Article.new
    end
  end

  def create
    @user=current_user
    @nav=Category.take(4)
    @categorys=Category.all
    if article_params[:category_id] != ""
      @category=Category.find(article_params[:category_id])
      @article=@category.articles.build(article_params)
      # サムネ画像の設定
      if params[:article][:image] == nil
        img=Image.find(@category.id + 1)
        @article.image.attach(img)
      else
        @article.image.attach(params[:article][:image])
      end
      if @article.save
        #フラッシュとリダイレクト
        flash[:success]="Article created"
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
    @categorys=Category.all
    @user=current_user
    @articles=Article.private_status_public.paginate(page: params[:page], per_page: 10).order(created_at: 'DESC')
  end

  def destroy
    @article=Article.find(params[:id]).destroy
    flash[:success]="Article deleted"
    redirect_to articles_url
  end

  def edit
    @user=current_user
    @nav=Category.take(4)
    @categorys=Category.all
    @article=Article.find(params[:id])
    @category=Category.find(@article.category_id)
  end

  def update
    @user=current_user
    @nav=Category.take(4)
    @categorys=Category.all
    @category=Category.find(article_params[:category_id])
    @article=@category.articles.find(params[:id])
    if @article.update(article_params)
      #フラッシュとリダイレクト
      flash[:success]="article updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def search
    @user=current_user
    @nav=Category.take(4)
    @categorys=Category.all
    @articles=Article.private_status_public.search(search_params[:keyword]).paginate(page: params[:page], per_page: 10).order(created_at: 'DESC')
    render 'search'
  end

  def drafts
    @nav=Category.take(4)
    @categorys=Category.all
    @user=current_user
    @articles=Article.private_status_private.paginate(page: params[:page], per_page: 10).order(created_at: 'DESC')
  end

  private
  def article_params
    params.require(:article).permit(:title, :abstract, :category_id, :image, :content, :private_status)
  end

  def search_params
    params.permit(:keyword)
  end
end
