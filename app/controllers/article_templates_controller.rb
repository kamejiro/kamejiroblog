class ArticleTemplatesController < ApplicationController
  before_action :check_login, only: [:create, :destroy, :index, :new, :edit, :update]
  before_action :check_admin, only: [:create, :destroy, :index, :new, :edit, :update]

  def new
    @user=current_user
    @nav=Category.take(4)
    @article_template=ArticleTemplate.new
  end

  def create
    @user=current_user
    @nav=Category.take(4)
    @article_template=ArticleTemplate.new(article_template_params)
    if @article_template.save
      #フラッシュとリダイレクト
      flash[:success]="ArticleTemplate created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    @user=current_user
    @nav=Category.take(4)
    @article_templates=ArticleTemplate.paginate(page: params[:page], per_page: 10).order(created_at: 'DESC')
  end

  def destroy
    @article_template=ArticleTemplate.find(params[:id]).destroy
    flash[:success]="ArticleTemplate deleted"
    redirect_to article_templates_url
  end

  def edit
    @user=current_user
    @nav=Category.take(4)
    @article_template=ArticleTemplate.find(params[:id])
  end

  def update
    @user=current_user
    @nav=Category.take(4)
    @article_template=ArticleTemplate.find(params[:id])
    if @article_template.update(article_template_params)
      #フラッシュとリダイレクト
      flash[:success]="articleTemplate updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private
  def article_template_params
    params.require(:article_template).permit(:title, :abstract, :content)
  end
end
