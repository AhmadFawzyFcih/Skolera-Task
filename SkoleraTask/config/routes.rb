Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users, 
              path: '',
              path_names: {
                sign_in: 'login',
                registration: 'register',
                sign_out: 'logout'
              },
              controllers: {
                sessions: 'sessions',
                registrations: 'registrations'
              }
  
  namespace 'api' do
    namespace 'v1' do

      resources :courses , only: [:index , :create]
      resources :student_courses
      resources :teacher_courses
      resources :reports
      
    end
  end

end
