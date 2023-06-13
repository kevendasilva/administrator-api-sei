Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :administrators, path: '', path_names: {
      sign_in: 'sign_in',
      sign_out: 'logout',
      registration: 'sign_up'
    },
    controllers: {
      sessions: 'administrators/sessions',
      registrations: 'administrators/registrations'
    }
  end
end
