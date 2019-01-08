require "active_support/notifications"
require "pay_u"

require "pay_u_rails/errors"
require "pay_u_rails/engine" if defined?(Rails)

module PayURails
  class Confirmation
    EVENT = PayU::Confirmation::EVENT
  end

  class Response
    EVENT = PayU::Response::EVENT
  end

  def self.instrument(event, payload)
    ActiveSupport::Notifications.instrument(event, payload)
  end


  def self.subscribe(event, callable = Proc.new)
    ActiveSupport::Notifications.subscribe(event) do |*args|
      callable.call(args.extract_options![:resource])
    end
  end
end
