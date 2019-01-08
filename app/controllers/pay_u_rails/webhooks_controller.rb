class PayURails::WebhooksController < ActionController::Base
  rescue_from PayURails::SignatureVerificationError, with: :unverified

  def confirmation
    process_webhook(resource_class: PayU::Confirmation)
  end


  def response_page
    process_webhook(resource_class: PayU::Response)
  end


  private def process_webhook(resource_class:)
    resource = validate(resource: resource_class.new(params))

    PayURails.instrument(resource_class::EVENT, resource: resource)

    head :ok
  rescue PayURails::SignatureVerificationError
    head :unauthorized
  end


  private def validate(resource:)
    raise PayURails::SignatureVerificationError unless resource.valid?

    resource
  end
end
