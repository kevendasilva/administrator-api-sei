Rails.application.routes.draw do
  get 'search/vehicle_by_plate'
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
  resources :movements, except: [:index, :show]
  resources :parkings
  get '/search/vehicle_by_plate', to: 'search#vehicle_by_plate'
  resources :vacancies, except: :show
end