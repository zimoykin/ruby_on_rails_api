Rails.application.routes.draw do

  resources :items
  post 'authenticate', to: 'authentication#authenticate'
  get 'welcome/index'
    resources :cities do
      resources :people do
        resources :items
      end
    end

    resources :people do
      resources :items
    end
    resources :items
  root 'welcome#index'

end
