Tooltime::Application.routes.draw do
  # misc routes
  get 'main/index'
  
  # data uploading
  post  'data/upload'
  match "/data/status/:job_id" => "data#status"
  
  # browse comparisons
  resources :comparisons, :only => [:index, :show] do
    resources :experiments, :only => [:index, :show]
  end
  
  # db summary: transcription factors
  resources :transcription_factors, :only => [:index]

  # db summary: genes
  resources :genes, :only => [:index]

  
  # main page
  root :to => 'main#index'
end
