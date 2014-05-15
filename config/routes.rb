Bioinformatica::Application.routes.draw do

  get "bioinformatica/snippets"
  get "bioinformatica/tags"

  resources :info_snippets
  resources :tags do
    resources :info_snippets
  end

  root :to => 'bioinformatica#snippets'
end
