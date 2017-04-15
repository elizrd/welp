Rails.application.routes.draw do

root 'places#index'

resources :places
#Priority is based upon order of creating: first created -> highest priority

end
