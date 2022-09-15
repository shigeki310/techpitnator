Rails.application.routes.draw do
  root to:'games#new'
  resources :games,only:%i[new create] do
    resources :progresses,only:%i[new create]
  end
end
