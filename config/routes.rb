Rails.application.routes.draw do
  root to:'games#new'
  resources :games,only:%i[new create] do
    member do
      get:give_up 
    end
    
    resources :progresses,only:%i[new create]
  end
end
