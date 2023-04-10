Rails.application.routes.draw do
  root to: 'homes#top'
  get '/search', to: 'searches#search'

 scope module: :customer do
    resources :posts,only: [:new,:create,:index,:show,:edit,:update] do
     resource :favorites,only: [:create,:destroy]
    resources :post_comments,only: [:create,:destroy]
  end
    resources :hobbies,only: [:create,:index,:edit,:update]
    resources :users, only: [:index,:show,:edit,:update,] do
     resource :relationships, only: [:create,:destroy]
     get 'followings' => 'relationships#followings', as: 'followings'
     get 'followers' => 'relationships#followers',as: 'followers'
    end
     get 'user/likes' => 'users#like'
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
