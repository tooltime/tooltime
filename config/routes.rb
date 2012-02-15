Tooltime::Application.routes.draw do
  get 'main/index'
  post 'data/upload'
  resources :comparisons, :only => [:index]
  root :to => 'main#index'
end
