class CategorysController < ApplicationController
  def show
    if params[:sort]==nil
      params[:sort]="created_at desc"
    end
    @user=current_user
    @nav=Category.take(4)
    @categorys=Category.all
    @categoryId=Category.find(params[:id])
    @feed_items=@categoryId.articles.paginate(page: params[:page], per_page: 10).order(params[:sort])
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
  end
end
