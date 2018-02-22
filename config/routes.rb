Rails.application.routes.draw do
  devise_for :users, controllers: {
      #confirmations: 'users/confirmations',
      #mailer: 'users/mailer',
      #passwords: 'users/passwords',
      #registrations: 'users/registrations',
      #shared: 'users/shared',
      #unlocks: 'users/unlocks',
      sessions: 'users/sessions',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }

  #devise_scope :user do
  #  get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
  #  get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  #end

  root to: 'pages#index'
end
