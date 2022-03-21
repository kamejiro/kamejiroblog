class StaticPagesController < ApplicationController
  def home
    @user=current_user
    @nav=Category.take(4)
    @feed_items=Article.paginate(page: params[:page], per_page: 10).order(created_at: 'DESC')
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
    @categorys=Category.all
  end

  def about
    @user=current_user
    @nav=Category.take(4)
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
    @categorys=Category.all
  end

  def rules
    @user=current_user
    @nav=Category.take(4)
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
    @categorys=Category.all
  end

  def contact
    @user=current_user
    @nav=Category.take(4)
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
    @categorys=Category.all
  end

  def others
    @user=current_user
    @nav=Category.take(4)
    @others=Category.find(4)
    @feed_items=@others.articles.paginate(page: params[:page], per_page: 10)
    @rank_items=Article.order(impressions_count: 'DESC').take(5)
    @categorys=Category.all
  end
end
