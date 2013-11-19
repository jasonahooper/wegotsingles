Wegotsingles::Application.routes.draw do
  root 'pages#home'
  resources :profiles, :only => [:create, :show, :update, :edit]
end
