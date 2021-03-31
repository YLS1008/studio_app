Rails.application.routes.draw do

  get 'admins/dashboard'
  devise_for :instructors, path: 'instructors', controllers: {registrations: 'instructors/registrations',
                                                                sessions: 'instructors/sessions'}
  devise_for :admins, path: 'admins', :skip => [:registrations] , controllers: { sessions: 'admins/sessions' }
  devise_for :users, path: 'users', controllers: {registrations: 'users/registrations',
                                                      sessions: 'users/sessions'}


  root :to => 'static_pages#home'
  
  get '/user', to: 'users#show', as: :user_root
  get '/admin', to: 'admins#dashboard', as: :admin_root
  get '/instructor', to: 'instructor#profile', as: :instructor_root


  get '/TBD', to: 'static_pages#placeholder', as: :placeholder
  get 'static_pages/about'
  get 'static_pages/contact'
end
