Rails.application.routes.draw do
  devise_for :models
  get 'sessions/new'
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

  get 'welcome/index'
	resources :articles do
	  resources :comments
	end
 
  root 'welcome#index'
end
