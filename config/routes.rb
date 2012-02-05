Tooltime::Application.routes.draw do
  get 'main/index'
  resources :comparisons, :only => [:index]
  root :to => 'main#index'
end
