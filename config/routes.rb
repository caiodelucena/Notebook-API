Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :contacts do
        resource :kind, only: [:show]
      end
      resources :kinds
    end
  end
end
