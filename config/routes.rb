Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do 
    namespace :v1 do 
      resources :courses do 
        resources :sections, shallow: true do 
          resources :lessons 
        end
      end 
    end
  end
end
