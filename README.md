# PayU Latam Rails Library

[![CircleCI](https://circleci.com/gh/lengio/payu-latam-rails.svg?style=svg)](https://circleci.com/gh/lengio/payu-latam-rails)
[![Maintainability](https://api.codeclimate.com/v1/badges/b497ad8d66bf768501f4/maintainability)](https://codeclimate.com/github/lengio/payu-latam-rails/maintainability)

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
