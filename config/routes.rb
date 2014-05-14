Bioinformatica::Application.routes.draw do

  resources :info_snippets
  resources :tags do
    resources :info_snippets
  end

  root :to => 'bioinformatica#index'
end
