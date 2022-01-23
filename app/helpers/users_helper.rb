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
end
