Rails.application.routes.draw do
  root :to => 'trips#index'

  get 'trips/:trip_id/expenses/add' => 'expenses#add', as: :add_expense
  post 'expenses' => 'expenses#create'

  get 'trips/:trip_id/expenses/history' => 'expenses#history', as: :history_expense

  delete '/expenses/:id' => 'expenses#destroy', as: :delete_expense

  resources :trips
  resources :expense_categories
  resources :destinations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
