Rails.application.routes.draw do
  devise_for :administrator, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'sign_up'
  },
  controllers: {
    sessions: 'administrators/sessions',
    registrations: 'administrators/registrations'
  }

  get '/current_administrator', to: 'current_administrator#index'
  resources :parkings
end