#no momento em que daministrador/login' to: acesse a controller login_administrador e o método (#login')
Rails.application.routes.draw do
  get 'login/sigin'
  get 'login/cadastrar'
  get 'login', to: 'login#login' 
  post 'logar', to: 'login#logar'
  get '/logout', to: 'login#logout'
  get 'loja/index',  to: 'loja#index'
  resources :usuarios, except: [:show]
  
  get 'administrador/login', to: 'login_administrador#login'
  post 'administrador/logar', to: 'login_administrador#logar'
  get 'administrador/logout', to: 'login_administrador#logout'
  resources :administradors
  resources :reservas, only: [:index, :show, :destroy]
  resources :clientes
  resources :veiculos
  resources :marcas
  root "loja#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
