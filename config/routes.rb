Bioinformatica::Application.routes.draw do

  resources :info_snippets, :only => [:show, :index] do
    resources :tags, :only => [:index]
  end
  resources :tags, :only => [:show, :index] do
    resources :info_snippets, :only => [:index]
  end
  resources :tag_types, :only => [:show] do
    resources :tags, :only => [:index]
  end

  root :to => 'bioinformatica#index'
end
