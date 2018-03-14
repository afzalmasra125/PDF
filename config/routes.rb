Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get "/exports/show.pdf" => 'exports#show'
 get "/exports/show" => 'exports#show'


 get "/student/:id" => 'students#show'
end
