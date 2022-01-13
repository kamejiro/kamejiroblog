class SessionsController < ApplicationController

  def new
    @nav=Category.take(4)
    @user=current_user
  end

  def create
    @nav=Category.take(4)
    @user=User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      login @user
      redirect_back_or root_url
    else
      flash.now[:danger]='Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logout if is_login?
    redirect_to root_url
  end
end
