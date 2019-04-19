Rails.application.routes.draw do
  get 'expenses/new'
  post 'expenses/create'
  root :to => 'trips#index'
  resources :trips
  resources :expense_categories
  resources :destinations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
