Wegotsingles::Application.routes.draw do
  root 'pages#home'
  post 'profiles', :to => 'profiles#create'
  patch 'profiles/:id', :to => 'profiles#update'
end
