Rails.application.routes.draw do


  get 'data/index'

  #root 'home#index', as: 'home_index'

  namespace :admin do
      resources :accounts
      resources :super_accounts
      resources :budget_approvers
      resources :employees
      resources :expense_reports
      resources :payment_managers
      resources :travel_authorizations

      root to: "accounts#index"
    end
  devise_for :accounts,  :controllers => { :registrations => 'registrations' }
  devise_scope :account do
  	#root "devise/sessions#new"
    get '/accounts/sign_out' => 'devise/sessions#destroy'
  authenticated :account do
    root 'home#index', as: 'home_index'
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
  resources :accounts
  resources :expense_reports
  resources :travel_authorizations

  resources :payment_managers
  resources :budget_approvers
  resources :employees
  resources :departments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
