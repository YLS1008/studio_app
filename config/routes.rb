Rails.application.routes.draw do

  
  resources :time_slots
  devise_for :instructors, path: 'instructors', controllers: {registrations: 'instructors/registrations',
                                                                sessions: 'instructors/sessions'}
  devise_for :admins, path: 'admins', :skip => [:registrations] , controllers: { sessions: 'admins/sessions' }
  devise_for :users, path: 'users', controllers: {registrations: 'users/registrations',
                                                      sessions: 'users/sessions'}



  resources :activities
  scope "/admin" do
    resources :instructors, only: [:show]
    get '/', to: 'admins#dashboard', as: :admin_root
  end

  root :to => 'static_pages#home'
  
  get '/user', to: 'users#show', as: :user_root
  get '/instructor', to: 'instructors#profile', as: :instructor_root


  get '/TBD', to: 'static_pages#placeholder', as: :placeholder
  get 'static_pages/about'
  get 'static_pages/contact'
end
