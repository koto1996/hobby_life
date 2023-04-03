Rails.application.routes.draw do
  
  root to: 'homes#top'
  
  namespace :customer do
  resources :hobbies,only: [:create,:index,:edit,:update]
end
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
