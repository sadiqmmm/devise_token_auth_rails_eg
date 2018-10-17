Rails.application.routes.draw do
  resources :blogs
  #devise_for :users

  mount_devise_token_auth_for 'User', at: 'api/auth', controllers: { sessions: 'api/auth/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: "json"} do
    resources :blogs, only: [:index, :update]    
  end

  root to: "blogs#index"
end
