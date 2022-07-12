class ImagesController < ApplicationController
  before_action :check_login, only: [:create, :destroy, :index, :new]
  before_action :check_admin, only: [:create, :destroy, :index, :new]

  def create
    @user=current_user
    @nav=Category.take(4)
    @categorys=Category.all
    @image=Image.new(image_params)
    if @image.save
      #フラッシュとリダイレクト
      flash[:success]="image uploaded"
      redirect_to images_url
    else
      render 'new'
    end
  end

  def index
    @user=current_user
    @nav=Category.take(4)
    @categorys=Category.all
    @images=Image.paginate(page: params[:page], per_page: 10).order(params[:sort])
  end

  def destroy
    @image=Image.find(params[:id]).destroy
    flash[:success]="Image deleted"
    redirect_to images_url
  end

  def new
    @user=current_user
    @nav=Category.take(4)
    @categorys=Category.all
    @image=Image.new
  end

  private
  def image_params
    params.require(:image).permit(:image, :sort)
  end
end
