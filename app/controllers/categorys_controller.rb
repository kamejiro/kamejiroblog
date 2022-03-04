class CategorysController < ApplicationController
  def show
    @user=current_user
    @nav=Category.take(4)
    @categoryId=Category.find(params[:id])
    @feed_items=@categoryId.articles.paginate(page: params[:page], per_page: 10)
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
  end
end
