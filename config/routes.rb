Rails.application.routes.draw do
  mount TokenAuthenticateMe::Engine => TokenAuthenticateMe.configuration.mount_path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Clobbers all routes, Keep this as the last route in the routes file
  mount_ember_app :frontend, to: '/', controller: 'ember_application'
end
