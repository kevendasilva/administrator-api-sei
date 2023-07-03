Rails.application.routes.draw do
  get 'search/vehicle_by_plate'
  devise_for :administrators, skip: [:sessions, :registrations, :passwords]
  devise_scope :administrator do
    # Sessions
    post   '/login',  to: 'administrators/sessions#create',  as: :administrator_session
    delete '/logout', to: 'administrators/sessions#destroy', as: :destroy_administrator_session
    # Registrations
    put    '/sign_up',  to: 'administrators/registrations#update',  as: nil
    delete '/sign_up',  to: 'administrators/registrations#destroy', as: nil
    post   '/sign_up',  to: 'administrators/registrations#create',  as: nil
    patch  '/sign_up',  to: 'administrators/registrations#update',  as: :administrator_registration
  end

  authenticate do
    # Parkings
    get    '/parkings',     to: 'parkings#index',   as: :parkings_path
    post   '/parkings',     to: 'parkings#create',  as: nil
    get    '/parkings/:id', to: 'parkings#show',    as: :parking_path
    patch  '/parkings/:id', to: 'parkings#update',  as: nil
    put    '/parkings/:id', to: 'parkings#update',  as: nil
    delete '/parkings/:id', to: 'parkings#destroy', as: nil
  end

  get '/current_administrator', to: 'current_administrator#index'
  resources :movements, except: [:index, :show]
  get '/search/vehicle_by_plate', to: 'search#vehicle_by_plate'
  resources :vacancies, except: :show
end