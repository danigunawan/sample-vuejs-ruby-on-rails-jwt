Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #add register routes
  get '/', to: 'users#index'
  post 'auth/register', to: 'users#register'
  post 'auth/login', to: 'users#login'
  get 'test', to: 'users#test'
  post 'video/create', to: 'videos#create'
  get 'video/list', to: 'videos#index'
  get 'video/my_list', to: 'videos#show'
  post 'video/my_video', to: 'videos#my_video'
  post 'comment/create', to: 'comments#create'
end
