Charity::Application.routes.draw do
  root 'organizations#index'

  resources :organizations
end
