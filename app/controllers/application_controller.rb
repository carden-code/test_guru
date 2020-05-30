class ApplicationController < ActionController::Base
  # Позволяет использовать метод в других контроллерах и шаблонах
  helper_method :current_user,
                :logget_in?,
                :log_out

  private

  # Метод обратного вызова. Определяет есть ли пользователь в сессии или нет.
  # Если нет redirect_to login_path и выводит flash сообщение.
  def authenticate_user!
    # Сохраняет в сессию путь с которого перешёл пользователь.
    session[:path] = request.path

    return redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please' unless current_user

    cookies[:email] = current_user.email
  end

  # Поиск пользователя по user_id который находится в сессии
  # если этот пользователь в сессии есть(что бы не делать лишний запрос к базе)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Метод logget_in? проверяет залогинен пользователь или нет.
  def logget_in?
    current_user.present?
  end

  # Метод log_out удаляет пользователя из сессии.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
