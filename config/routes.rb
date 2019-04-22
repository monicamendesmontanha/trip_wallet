Rails.application.routes.draw do

  root :to => 'trips#index'

  get 'trips/:trip_id/expenses/add' => 'expenses#add', as: :add_expense
  post 'expenses' => 'expenses#create'

  get 'trips/:trip_id/expenses/history' => 'expenses#history', as: :history_expense
  get 'trips/:trip_id/expenses/chart' => 'expenses#chart', as: :chart

  delete '/expenses/:id' => 'expenses#destroy', as: :delete_expense

  resources :trips
  resources :expense_categories
  resources :destinations

  get '/signup' => 'users#signup', as: :signup_user_path
  post '/signup' => 'users#create'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
