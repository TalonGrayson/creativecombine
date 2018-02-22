Rails.application.routes.draw do
  devise_for :users, controllers: {
      confirmations: 'users/confirmations',
      mailer: 'users/mailer',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      shared: 'users/shared',
      unlocks: 'users/unlocks',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'pages#index'
end
