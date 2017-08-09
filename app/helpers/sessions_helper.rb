module SessionsHelper
    
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
    p user.id
    p "session create"
    # render text: "#{user.id}"
  end

  # ユーザーを永続的セッションに記憶する
  def remember(user)
    p "remember start"
    user.remember
    # cookies.permanent.signed[:user_id] = user.id
    # cookies.permanent[:user_id] = user.id
    # cookies.permanent[:remember_token] = user.remember_token
  end

  # 記憶トークンcookieに対応するユーザーを返す
  # ユーザID以上の数はこないと仮定
  def current_user(user_id)
    user = User.find_by(remember: user_id)
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif user
      log_in user
      @current_user = user
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?(user_id)
    !current_user(user_id).nil?
  end

  # 永続的セッションを破棄する
  def forget(user)
    user.forget
    # cookies.delete(:user_id)
    # cookies.delete(:remember_token)
  end

  # 現在のユーザーをログアウトする
  def log_out(user)
    forget(user)
    session.delete(user[:user_id])
    @current_user = nil
  end

end