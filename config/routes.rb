Rails.application.routes.draw do

  get '*route' => 'application#index'


  root 'application#index'


end
