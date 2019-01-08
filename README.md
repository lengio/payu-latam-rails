# PayU Latam Rails Library

## Installation

    gem "payu-latam-rails", github: "lengio/payu-latam-rails", require: "pay_u_rails"

    # Local
    gem build payu-latam-rails.gemspec

## Subscribing with blocks

```ruby
PayURails.subscribe(PayURails::Confirmation::EVENT) do |confirmation|
    # Do something with PayU::Confirmation object
end

PayURails.subscribe(PayURails::Response::EVENT) do |response|
    # Do something with PayU::Response object
end

```

## Subscribing with objects

```ruby
class Subscriber
    def call(confirmation)
        # Do something with PayU::Confirmation object
    end
end

PayURails.subscribe(PayURails::Confirmation::EVENT, Subscriber.new)

```

## Testing

    rspec

## Console

    bin/console
