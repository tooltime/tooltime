Tooltime::Application.routes.draw do
  # misc routes
  get 'main/index'
  
  # analytics
  get "gene_search/index"
  get 'gene_search/search'
  get "popular_factors/index"
  get "popular_factors/search"
  get "popular_factors/results"
  
  # data uploading
  post  'data/upload'
  match "/data/status/:job_id" => "data#status"
  
  # browse comparisons
  resources :comparisons do
    resources :experiments do
      resources :genes, :only => [:show], :controller => 'browse_genes' do
        resources :regulatory_elements, :only => [:show], :controller => 'browse_regulatory_elements'
      end
    end
  end
  
  # db summary: transcription factors
  resources :transcription_factors

  # db summary: genes
  resources :genes

  # db summary: regulatory elements
  resources :regulatory_elements
  
  # main page
  root :to => 'main#index'
end
