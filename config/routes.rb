Rails.application.routes.draw do

  resources :trainees
  devise_for :instructors, path: 'instructors', controllers: {registrations: 'instructors/registrations',
                                                                sessions: 'instructors/sessions'}
  devise_for :admins, path: 'admins', :skip => [:registrations] , controllers: { sessions: 'admins/sessions' }
  devise_for :users, path: 'users', controllers: {registrations: 'users/registrations',
                                                      sessions: 'users/sessions'}



  resources :activities
  resources :instructors, only: [:index]
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
    patch '/load_tickets', to: 'trainees#load_tickets', as: :load_tickets
    get 'enrollments/enroll', to: 'enrollments#enroll', as: :enroll
    get 'enrollments/cancel', to: 'enrollments#cancel', as: :cancel_enrollment
    get 'enrollments/finalize', to: 'enrollments#finalize', as: :finalize
    get 'enrollments/enroll_child', to: 'enrollments#enroll_child', as: :enroll_child
    post 'enrollments/create_child', to: 'enrollments#create_child', as: :create_child
    get '/conversations/:id', to: 'admins#conversation', as: :conversation
    post '/conversations/log_new', to: 'admins#log_conversation', as: :log_conversation
    post '/tasks/add_task', to: 'admins#add_task', as: :add_task
    get '/tasks/closed', to: 'admins#closed_tasks', as: :closed_tasks
    post '/tasks/update_status', to: 'admins#update_status', as: :update_status
    get '/calendar', to: 'admins#calendar', as: :calendar
  end

  get '/TBD', to: 'static_pages#placeholder', as: :placeholder
  get 'static_pages/about'
  get 'static_pages/contact'
  get '/thank_you', to: 'static_pages#thanks', as: :after_contact
  get 'instructors/:id', to: 'instructors#home', as: :instructor
  get '/cancel_enroll', to: 'trainees#cancel_enroll', as: :cancel_enroll
end
