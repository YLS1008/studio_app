Rails.application.routes.draw do

  get 'groups/index'
  get 'groups/show'
  get 'groups/cancel'
  get 'groups/destroy'
  get 'groups/change_status'
  devise_for :instructors, path: 'devise_instructors', controllers: {registrations: 'instructors/registrations',
                                                                sessions: 'instructors/sessions'}
  devise_for :admins, path: 'devise_admins', :skip => [:registrations] , controllers: { sessions: 'admins/sessions' }
  devise_for :users, path: 'devise_users', controllers: {registrations: 'users/registrations',
                                                      sessions: 'users/sessions'}



  resources :activities
  resources :instructors, only: [:index]
  resources :contacts
  resources :time_slots, except: [:update]
  resources :trainees


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
    patch '/tasks/update_status', to: 'admins#update_status', as: :update_status
    get '/calendar', to: 'admins#calendar', as: :calendar
    get '/instructors/edit/(:id)', to: 'instructors#edit', as: :edit_instructor
    patch '/instructors/update/(:id)', to: 'instructors#update', as: :update_instructor
    delete '/time_slots/destroy_slot_for/(:id)', to: 'time_slots#destroy_slots', as: :destroy_slots
    get '/time_slots/change_time_for/(:id)', to: 'time_slots#change_time', as: :change_slot_time
    patch '/time_slots/reschedule', to: 'time_slots#reschedule', as: :reschedule
    get 'groups/index', to: 'groups#index', as: :groups
  end

  get '/TBD', to: 'static_pages#placeholder', as: :placeholder
  get 'static_pages/about'
  get 'static_pages/contact'
  get '/thank_you', to: 'static_pages#thanks', as: :after_contact
  get 'instructors/:id', to: 'instructors#home', as: :instructor
  get '/cancel_enroll', to: 'trainees#cancel_enroll', as: :cancel_enroll
end
