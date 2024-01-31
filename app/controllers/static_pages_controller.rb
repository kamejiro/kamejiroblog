class StaticPagesController < ApplicationController
  def home
    if params[:sort]==nil
      params[:sort]="created_at desc"
    end
    @user=current_user
    @nav=Category.take(4)
    @feed_items=Article.private_status_public.paginate(page: params[:page], per_page: 10).order(params[:sort])
    @rank_items=Article.private_status_public.order(impressions_count: 'DESC').take(5)
    @categorys=Category.all
  end

  def about
    @user=current_user
    @nav=Category.take(4)
    @rank_items=Article.private_status_public.order(impressions_count: 'DESC').take(5)
    @categorys=Category.all
  end

  def rules
    @user=current_user
    @nav=Category.take(4)
    @rank_items=Article.private_status_public.order(impressions_count: 'DESC').take(5)
    @categorys=Category.all
  end

  def contact
    @user=current_user
    @nav=Category.take(4)
    @rank_items=Article.private_status_public.order(impressions_count: 'DESC').take(5)
    @categorys=Category.all
  end

  def others
    if params[:sort]==nil
      params[:sort]="created_at desc"
    end
    @user=current_user
    @nav=Category.take(4)
    @others=Category.find(4)
    @feed_items=@others.articles.paginate(page: params[:page], per_page: 10).order(params[:sort])
    @rank_items=Article.private_status_public.order(impressions_count: 'DESC').take(5)
    @categorys=Category.all
  end
end
