Prose::Engine.routes.draw do
  resources :pages do
    collection do
      post "rebuild"
    end
    member do
      post "rebuild_slug"
      post "save_content"
      put "save_content"
    end
  end
  resources :templates, :regions, :template_regions, :assets
end
