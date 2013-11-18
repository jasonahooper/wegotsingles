Wegotsingles::Application.routes.draw do
  root 'pages#home'

  resources :users, :only => [:show] do
    resources :profiles, :only => [:show]
  end
end
