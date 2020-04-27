Rails.application.routes.draw do
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
post 'authenticate', to: 'authentication#authenticate'
end
 
# eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODgxMDkwNzZ9.PgBAmCWHFk8S7fN5JUNO0FOOoFMe-mRvvsphiZ-lJpQ