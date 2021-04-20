Rails.application.routes.draw do

  resources :trainees
  devise_for :instructors, path: 'instructors', controllers: {registrations: 'instructors/registrations',
                                                                sessions: 'instructors/sessions'}
  devise_for :admins, path: 'admins', :skip => [:registrations] , controllers: { sessions: 'admins/sessions' }
  devise_for :users, path: 'users', controllers: {registrations: 'users/registrations',
                                                      sessions: 'users/sessions'}



  resources :activities
  resources :instructors, only: [:show, :index]
  resources :contacts
  resources :time_slots
  

  unauthenticated :admin do
    unauthenticated :instructor do
      unauthenticated :user do
        root :to => 'static_pages#home', as: :root
      end
      authenticated :user do
        root :to => 'users#home', as: :user_root
        get '/purchase_tickets', to: 'users#purchase', as: :user_purchase
      end
    end
    authenticated :instructor do
      root :to => 'instructors#home', as: :instructor_root
    end
  end
  authenticated :admin do
    root :to => 'admins#dashboard', as: :admin_root
    get '/convert', to: 'contacts#convert', as: :convert
    get '/load_tickets', to: 'trainee#load_tickets', as: :load_tickets
  end

  get '/TBD', to: 'static_pages#placeholder', as: :placeholder
  get 'static_pages/about'
  get 'static_pages/contact'
  get '/thank_you', to: 'static_pages#thanks', as: :after_contact
end
