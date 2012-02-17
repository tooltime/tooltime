Tooltime::Application.routes.draw do
  get 'main/index'
  
  post  'data/upload'
  match "/data/status/:job_id" => "data#status"
  
  resources :comparisons, :only => [:index]
  
  root :to => 'main#index'
end
