Rails.application.routes.draw do
  root to: 'homes#top'
  get '/search', to: 'searches#search'

  namespace :customer do
  resources :posts,only: [:new,:create,:index,:show,:edit,:update] do
    resource :favorites,only: [:create,:destroy]
  end
  resources :hobbies,only: [:create,:index,:edit,:update]
end
 scope module: :customer do
   get 'user/mypage' => 'users#show'
   get 'user/mypage/edit' => 'users#edit'
   patch 'user/mypage' => 'users#update'
   get '/users' => 'users#index'
 end
  #customer
# 会員用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords],controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
