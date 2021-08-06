Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gardens, only: :show
  resources :plots, only: :index
  resources :plants, only: :destroy

end
