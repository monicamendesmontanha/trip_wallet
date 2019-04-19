Rails.application.routes.draw do
  root :to => 'trips#index'

  get 'trips/:trip_id/expenses/new' => 'expenses#new'
  post 'expenses' => 'expenses#create'

  get 'trips/:trip_id/expenses/history' => 'expenses#history'

  resources :trips
  resources :expense_categories
  resources :destinations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
