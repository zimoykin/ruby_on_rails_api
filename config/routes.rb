Rails.application.routes.draw do

  resources :items
  post 'authenticate', to: 'authentication#authenticate'
  get 'welcome/index'
    resources :cities do
      resources :people
    end
    resources :people
  root 'welcome#index'
  
end
