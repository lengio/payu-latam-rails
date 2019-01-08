PayURails::Engine.routes.draw do
  post :confirmation, to: "webhooks#confirmation"
  get :response, to: "webhooks#response_page"
end
