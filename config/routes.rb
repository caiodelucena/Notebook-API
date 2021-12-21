Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :contacts do
        resource :kind, only: [:show]
        resource :phones, only: [:show] 
        resource :phone, except: [:index, :show]
        resource :address, except: [:index]
      end
      resources :kinds
    end
  end
end
