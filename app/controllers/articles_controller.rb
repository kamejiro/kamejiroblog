class ArticlesController < ApplicationController

  def show
    @article=Article.find(params[:id])
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
    impressionist(@article, nil, unique: [:ip_address])
  end
end
