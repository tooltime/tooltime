Tooltime::Application.routes.draw do
  # misc routes
  get 'main/index'
  
  # data uploading
  post  'data/upload'
  match "/data/status/:job_id" => "data#status"
  
  # browse comparisons
  resources :comparisons, :only => [:index, :show] do
    resources :experiments, :only => [:show] do
      resources :genes, :only => [:show], :controller => 'browse_genes' do
        resources :regulatory_elements, :only => [:show], :controller => 'browse_regulatory_elements'
      end
    end
  end
  
  # db summary: transcription factors
  resources :transcription_factors, :only => [:index, :show]

  # db summary: genes
  resources :genes, :only => [:index]

  # db summary: regulatory elements
  resources :regulatory_elements, :only => [:index]
  
  # main page
  root :to => 'main#index'
end
