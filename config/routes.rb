Bioinformatica::Application.routes.draw do

  get "bioinformatica/snippets"
  get "bioinformatica/tags"

  resources :info_snippets, :only => [:show, :index]
  resources :tags, :only => [:index] do
    resources :info_snippets, :only => [:index]
  end
  resources :tag_types, :only => [:show] do
    resources :tags, :only => [:index]
  end

  root :to => 'bioinformatica#snippets'
end
