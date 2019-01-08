require "rails_helper"
require "spec_helper"
require "fixtures/confirmation"
require "fixtures/response"

RSpec.describe PayURails::WebhooksController, type: :controller do
  routes { PayURails::Engine.routes }

  before(:all) do
    @confirmations = []
    @responses = []

    PayURails.subscribe(PayURails::Confirmation::EVENT) do |confirmation|
      @confirmations << confirmation
    end

    PayURails.subscribe(PayURails::Response::EVENT) do |response|
      @responses << response
    end
  end

  context "incorrect signature" do
    it "returns unauthorized status" do
      post :confirmation, params: Fixtures.confirmation.merge(sign: "")

      expect(response).to have_http_status(:unauthorized)
    end
  end

  context "correct signature" do
    it "returns ok and instruments event on confirmation" do
      params = Fixtures.confirmation
      confirmation = PayU::Confirmation.new(params)

      post :confirmation, params: params

      expect(response).to have_http_status(:ok)
      expect(@confirmations.last.order).to have_attributes(
        amount: confirmation.order.amount,
        reference_code: confirmation.order.reference_code,
      )
    end

    it "returns ok and instruments event on response" do
      params = Fixtures.response
      response_obj = PayU::Response.new(params)

      get :response_page, params: Fixtures.response

      expect(response).to have_http_status(:ok)
      expect(@responses.last.order).to have_attributes(
        amount: response_obj.order.amount,
        reference_code: response_obj.order.reference_code,
      )
    end

    it "calls #call method when subscribing with object" do
      subscriber = spy("subscriber")
      PayURails.subscribe(PayURails::Confirmation::EVENT, subscriber)

      post :confirmation, params: Fixtures.confirmation

      expect(subscriber).to have_received(:call)
    end
  end
end
