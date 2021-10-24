class StaticPagesController < ApplicationController
  def home
    @feed_items=Article.paginate(page: params[:page], per_page: 10)
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
  end

  def about
  end

  def rules
  end
end
