Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :courses, only: [:index, :show]
  namespace :instructor do
  	resources :sections, only: [] do
  		resources :lesssons, only: [:new, :create]
  	end
    resources :courses, only: [:new, :create, :show] do
			resources :lesssons, only: [:new, :create]
    end
  end
end