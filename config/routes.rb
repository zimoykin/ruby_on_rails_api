Rails.application.routes.draw do
  get 'welcome/index'
    resources :cities do
      resources :people
    end
  root 'welcome#index'
end
