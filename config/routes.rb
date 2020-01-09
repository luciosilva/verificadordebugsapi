Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root to: ->(_) { [200, {}, ['V1 da api de verificacao de bugs']] }
      resources :comments
      resources :bugs_histories
      resources :bugs
      resources :users
      resources :groups_configs
      resources :tfs_configs
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
