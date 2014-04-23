Charity::Application.routes.draw do
  resources :organizations

  root 'organization#index'
end
