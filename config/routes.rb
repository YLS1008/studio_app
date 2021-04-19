Rails.application.routes.draw do

  devise_for :instructors, path: 'instructors', controllers: {registrations: 'instructors/registrations',
                                                                sessions: 'instructors/sessions'}
  devise_for :admins, path: 'admins', :skip => [:registrations] , controllers: { sessions: 'admins/sessions' }
  devise_for :users, path: 'users', controllers: {registrations: 'users/registrations',
                                                      sessions: 'users/sessions'}



  resources :activities
  resources :instructors, only: [:show, :index]
  resources :contacts
  resources :time_slots
  
  scope "/admin" do
        get '/', to: 'admins#dashboard', as: :admin_root    
  end

  unauthenticated :admin do
    unauthenticated :instructor do
      unauthenticated :user do
        root :to => 'static_pages#home', as: :root
      end
      authenticated :user do
        root :to => 'users#home', as: :user_root
      end
    end
    authenticated :instructor do
      root :to => 'instructors#home', as: :instructor_root
    end
  end
  authenticated :admin do
    root :to => 'admins#dashboard', as: :admin_root
  end

  get '/TBD', to: 'static_pages#placeholder', as: :placeholder
  get 'static_pages/about'
  get 'static_pages/contact'
end
