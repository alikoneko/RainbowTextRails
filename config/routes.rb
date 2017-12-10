Rails.application.routes.draw do
  get 'text/index'

  root 'text#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
