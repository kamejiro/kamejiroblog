class StaticPagesController < ApplicationController
  def home
    @user=User.find(1)
    @nav=Category.take(4)
    @feed_items=Article.paginate(page: params[:page], per_page: 10).order(created_at: 'DESC')
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
  end

  def about
    @nav=Category.take(4)
  end

  def rules
    @nav=Category.take(4)
  end

  def others
    @nav=Category.take(4)
    @others=Category.find(4)
    @feed_items=@others.articles.paginate(page: params[:page], per_page: 10)
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
  end
end
