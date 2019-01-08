require "rails_helper"
require "spec_helper"

RSpec.describe PayURails::WebhooksController, type: :controller do
  routes { PayURails::Engine.routes }

  it "returns ok on confirmation" do
    post :confirmation

    expect(response).to have_http_status(:ok)
  end

  it "returns ok on response" do
    get :response_page

    expect(response).to have_http_status(:ok)
  end
end
