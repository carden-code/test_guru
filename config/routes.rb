Rails.application.routes.draw do

  root 'tests#index'

  get :signup, to: 'users#new'

  # отображение формы и ведёт на метод new внутри ssesions controller
  get :login, to: 'sessions#new'
  delete :exit, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  # ресурс Вопросов, вложенный в ресурс Тестов.
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
