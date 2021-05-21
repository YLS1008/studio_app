Rails.application.routes.draw do

  
  devise_for :instructors, path: 'devise_instructors', controllers: {registrations: 'instructors/registrations',
                                                                sessions: 'instructors/sessions'}
  devise_for :admins, path: 'devise_admins', :skip => [:registrations] , controllers: { sessions: 'admins/sessions' }
  devise_for :users, path: 'devise_users', controllers: {registrations: 'users/registrations',
                                                      sessions: 'users/sessions'}



  resources :activities
  resources :instructors, only: [:index]
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
      get '/instructor/(:id)/salary', to: 'instructors#salary', as: :salary
      get '/instructor/(:id)/classes', to: 'instructors#my_classes', as: :my_classes
      get '/instructor/(:id)/instructor_edit_profile', to: 'instructors#instructor_edit_profile', as: :instructor_edit_profile
      patch 'instructor/(:id)/update', to: 'instructors#update', as: :update_instructor_profile
    end
  end

  authenticated :admin do
    root :to => 'admins#dashboard', as: :admin_root

    scope '/enrollments' do
      get '/enroll', to: 'enrollments#enroll', as: :enroll
      get '/cancel', to: 'enrollments#cancel', as: :cancel_enrollment
      get '/finalize', to: 'enrollments#finalize', as: :finalize
      get '/enroll_child', to: 'enrollments#enroll_child', as: :enroll_child
      get '/enroll_via_slot', to: 'enrollments#enroll_via_slot', as: :enroll_via_slot
      patch '/finalize_for_slot', to: 'enrollments#finalize_for_slot', as: :finalize_for_slot

    end

    scope '/payments' do
      get '/index', to: 'payments#index', as: :payments_index
      patch '/pay', to: 'payments#pay', as: :payment
      get '/refund', to: 'payments#refund', as: :refund_payment
      get '/monthly_payment', to: 'payments#monthly_payment', as: :monthly_payment
    end

    post '/create_child', to: 'enrollments#create_child', as: :create_child
    get '/conversations/:id', to: 'admins#conversation', as: :conversation
    post '/conversations/log_new', to: 'admins#log_conversation', as: :log_conversation
    post '/tasks/add_task', to: 'admins#add_task', as: :add_task
    get '/tasks/closed', to: 'admins#closed_tasks', as: :closed_tasks
    patch '/tasks/update_status', to: 'admins#update_status', as: :update_status
    get '/calendar', to: 'admins#calendar', as: :calendar
    get '/instructors/edit/(:id)', to: 'instructors#edit', as: :edit_instructor
    patch '/instructors/(:id)/update', to: 'instructors#update', as: :update_instructor
    delete '/time_slots/destroy_slot_for/(:id)', to: 'time_slots#destroy_slots', as: :destroy_slots
    get '/time_slots/change_time_for/(:id)', to: 'time_slots#change_time', as: :change_slot_time
    patch '/time_slots/reschedule', to: 'time_slots#reschedule', as: :reschedule
    get 'enrollments/history/(:id)', to: 'enrollments#history', as: :enroll_history
    get '/activities/(:id)/contract/new_contract', to: 'contracts#new', as: :new_contract
    get '/activities/(:id)/contract/edit_contract', to: 'contracts#edit', as: :edit_contract
    post '/activities/(:id)/contracts/set_contract', to: 'contracts#set', as: :set_contract
    patch '/activities/(:id)/contracts/update_contract', to: 'contracts#update', as: :update_contract
    get '/all_salaries', to: 'admins#all_salaries', as: :all_salaries
    get '/time_slots/lock/(:id)', to: 'time_slots#lock', as: :lock_time_slot
    end

  get '/TBD', to: 'static_pages#placeholder', as: :placeholder
  get 'static_pages/coming_soon', to: 'static_pages#coming_soon', as: :coming_soon
  get 'instructors/:id', to: 'instructors#show', as: :instructor
  get '/cancel_enroll', to: 'trainees#cancel_enroll', as: :cancel_enroll
end
