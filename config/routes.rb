Rails.application.routes.draw do

  resources :reviews

  resources :contacts

  get 'white/index'

  devise_for :installs
  resources :orders do
  resources :orderitems
  end
  
  devise_for :users do
  resources :orders
  end
  

  get 'orderitems/index'

  get 'orderitems/show'

  get 'orderitems/new'

  get 'orderitems/edit'

  resources :profiles

  get 'review/index'
  get 'review/show'
  get 'review/new'
  get 'review/edit'

  resources :reviews


get '/home' =>'home#index'
get '/red' => 'red#index'
get '/white' => 'white#index'
get '/contact' => 'site#contact'
get '/myprofile' => 'profiles#myprofile' 
get '/about' => 'site#about'
get '/contact' => 'site#contact'
get '/Admin'=> 'user#admin_login'
get '/payment' => 'cart#payment'
get '/cart' => 'cart#index'
get '/cart/clear' => 'cart#clearCart'
get '/cart/:id' => 'cart#add'
get '/cart/remove/:id' => 'cart#remove'
get '/checkout' => 'cart#createOrder'
resources :items


# config/routes.rb
get "/404", :to => "errors#not_found"
get "/422", :to => "errors#unacceptable"
get "/500", :to => "errors#internal_error"


 root :to => 'home#index'
  
end


