Wegotsingles::Application.routes.draw do
  root 'pages#home'
  resources :profiles, :only => [:show, :update, :edit]
end
