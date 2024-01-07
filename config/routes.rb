Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # root for registration
  namespace :api do
    namespace :v1 do
      post 'registrations/create', to: 'registrations#create'
    end
  end

  namespace :admin do
    resources :pending_doctors, controller: 'pending_doctors' do
      put :accept, on: :member
      put :reject, on: :member
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
