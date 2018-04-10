Rails.application.routes.draw do
  namespace :admins do
    get 'dashboard/index'
  end

  devise_for :admins
  namespace :users do
    get 'dashboard/index'
  end

  root to: 'home#index'

  devise_for :users

  authenticate :user do
    namespace :users do
      root to: 'dashboard#index'
    end
  end

  authenticate :admin do
    namespace :admins do
      root to: 'dashboard#index'
    end
  end
end
