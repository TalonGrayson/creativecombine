Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    authenticated :user do
      root to: 'pages#index', as: :root
    end

    unauthenticated :user do
      root to: 'users/sessions#new', as: :unauthenticated_root
    end

    get '/users/sign_out' => 'users/sessions#destroy'
  end

  get 'registered_users' => 'pages#registered_users'

end
