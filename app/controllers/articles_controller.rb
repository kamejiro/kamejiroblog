class ArticlesController < ApplicationController

  def show
    @nav=Category.take(4)
    @article=Article.find(params[:id])
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
  end
end
