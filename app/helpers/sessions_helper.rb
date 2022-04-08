module SessionsHelper

  # user_idを返す。登録してなかったらnilを返す。
  def current_user
    if(user_id = session[:user_id])# user_idがnilでなければ
        # インスタンス変数がnilの時のみSQLを実行することでDBへの問い合わせを減らしている。
      if @current_user.nil?
        @current_user = User.find_by(id: user_id)
      else
        @current_user
      end
    end
  end

  def current_user?(user)
    user && user==current_user
  end

  # ログインするメソッド
  def login(user)
    session[:user_id]=user.id
  end

  # ログインしているか確認する
  def is_login?
    !current_user.nil?
  end

  def check_login
    if !is_login?
      flash[:danger]="please login"
      redirect_to login_url
    end
  end

  # ログアウトするメソッド
  def logout
    session.delete(:user_id)
  end

  # 前いた場所を覚えておく
  def remember_location
    session[:fowarding_url]=request.original_url if request.get?
  end

  # 前いた場所へ返してあげる
  def redirect_back_or(default)
    redirect_to(session[:fowarding_url] || default)
    session.delete(:fowarding_url)
  end
end
