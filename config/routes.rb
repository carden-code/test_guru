Rails.application.routes.draw do
  get '/about', to: 'info_pages#about'
  get '/about/author', to: 'info_pages#author'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
