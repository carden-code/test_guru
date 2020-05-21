Rails.application.routes.draw do

  # ресурс Вопросов, вложенный в ресурс Тестов.
  resources :tests do
    resources :questions, shallow: true
  end
end
