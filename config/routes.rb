Tooltime::Application.routes.draw do
  get "transcription_factors/index"

  get 'main/index'
  
  post  'data/upload'
  match "/data/status/:job_id" => "data#status"
  
  resources :comparisons, :only => [:index]
  resources :transcription_factors, :only => [:index]
  
  root :to => 'main#index'
end
