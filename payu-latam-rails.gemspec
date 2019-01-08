$LOAD_PATH.unshift(::File.join(::File.dirname(__FILE__), "lib"))

require "pay_u_rails/version"

Gem::Specification.new do |spec|
  spec.name = "payu-latam-rails"
  spec.version = PayURails::VERSION
  spec.required_ruby_version = ">= 2.1.0"
  spec.summary = "Rails webhooks PayU Latam"
  spec.description = "Accept payments with PayU Latam: http://developerspec.payulatam.com/es/."
  spec.author = "Slang"
  spec.email = "engineering@slang.com"
  spec.homepage = "https://slangapp.com"
  spec.license = "MIT"

  spec.add_dependency "activesupport", ">= 3.1"
  spec.add_dependency "payu-latam", "1.0.1"

  spec.add_development_dependency "byebug", "~> 10.0"
  spec.add_development_dependency "coveralls", "~> 0"
  spec.add_development_dependency "pry", "~> 0.12"
  spec.add_development_dependency "pry-byebug", "~> 3.6"
  spec.add_development_dependency "rails", [">= 3.1"]
  spec.add_development_dependency "rake", "< 11.0"
  spec.add_development_dependency "rspec-rails", "~> 3.7"
  spec.add_development_dependency "rspec_junit_formatter", "~> 0"
  spec.add_development_dependency "rubocop", "0.57"
  spec.add_development_dependency "webmock", "~> 1.9"

  spec.files = `git ls-files`.split("\n")
  spec.test_files = `git ls-files -- spec/*`.split("\n")
  spec.executables = `git ls-files -- bin/*`.split("\n").map { |f| ::File.basename(f) }
  spec.require_paths = ["lib"]
end
