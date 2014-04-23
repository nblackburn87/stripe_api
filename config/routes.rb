Charity::Application.routes.draw do
  root 'organizations#index'

  resources :charges
  resources :organizations
end
