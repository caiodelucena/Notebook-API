Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :contacts
      resources :kinds
    end
  end
end
