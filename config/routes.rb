Rails.application.routes.draw do
  resources :users



  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "pages_presentation(/:name)", to: 'pages#salut', as: 'presentation' # Dans le controller nommé pages_controller, méthode salut

  root to: 'pages#home' # Définir la route racine vers pages#home
  resources :posts # Définir les paths
  resources :categories


end
