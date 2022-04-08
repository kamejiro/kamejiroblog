module UsersHelper

  def is_admin?
    if current_user
        current_user.admin?
    end
  end

  def check_admin
    if !is_admin?
      redirect_to root_url
    end
  end

  def check_myself
    @user=User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
