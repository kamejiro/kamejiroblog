class UsersController < ApplicationController

  def signup
    @nav=Category.take(4)
    @user=User.new
  end

  def create
    @nav=Category.take(4)
    @user=User.new(user_params)
    if @user.save
      #フラッシュとリダイレクト
      flash[:success]="user created"
      redirect_to root_url
    else
      render 'signup'
    end
  end

  def destroy
    @user=User.find(params[:id]).destroy
    flash[:success]="User deleted"
    redirect_to users_url
  end

  def index
    @nav=Category.take(4)
    @user=User.find(1)#ログイン機能後消す
    @users=User.paginate(page: params[:page], per_page: 10).order(created_at: 'DESC')
  end

  def edit
    @nav=Category.take(4)
    @user=User.find(params[:id])
  end

  def update
    @nav=Category.take(4)
    @user=User.find(params[:id])
    if @user.update(user_params)
      #フラッシュとリダイレクト
      flash[:success]="user updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
