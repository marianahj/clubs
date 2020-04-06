Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #admins
  namespace :admin do
    resources :clubs
  end

  #members
  namespace :member do
    resources :clubs, only: :index
  end


  root to: 'home#index'
end
