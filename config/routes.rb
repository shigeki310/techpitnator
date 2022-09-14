Rails.application.routes.draw do
  get'games/new'
  root 'games#new'
end
