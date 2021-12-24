Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :contacts do
        resource :address, except: [:index]
        resource :kind, only: [:show]
        resource :phones, only: [:show] 
        resource :phone, except: [:index, :show]
      end
      resources :auths, only: [:create]
      resources :kinds
    end
  end
end
