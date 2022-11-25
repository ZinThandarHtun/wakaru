Rails.application.routes.draw do

  get 'users', to: "api/v1/user#index"

  namespace :api do
    namespace :v1 do
      # サンプル画面
      get 'sample/index', to: "sample#index"
      post 'sample/create'
    end
  end 

  devise_for :users
  namespace :api do
    namespace :v1 do
      get 'user/index', to: "user#index"
      post 'user/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'writing_policy/firstLoad', to: "writing_policy#firstLoad"
      post 'writing_policy/create', to: "writing_policy#create"
      put 'writing_policy/destroy/:id', to: "writing_policy#destroy"
      put 'writing_policy/update/:id', to: "writing_policy#update"
    end
  end
# namespace :api do
#     namespace :v1 do
#       # サンプル画面
#       get 'template_types/index', to: "template_types#index"
#       post 'template_types/create',to: "template_types#create"
#     end
#   end 
  get 'home/index'
  root 'home#index'
  get '/writing_policies', to: "api/v1/writing_policy#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end