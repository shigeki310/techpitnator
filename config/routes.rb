Rails.application.routes.draw do
  root to:'games#new'
  resources :games,only:%i[new create update] do
    member do
      get:give_up 
      get:challenge
      get:correct
    end
    
    resources :progresses,only:%i[new create]
  end
end
