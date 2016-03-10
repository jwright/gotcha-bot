# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gotcha-bot/version"

Gem::Specification.new do |spec|
  spec.name          = "gotcha-bot"
  spec.version       = GotchaBot::VERSION
  spec.authors       = ["Jamie Wright"]
  spec.email         = ["jamie@brilliantfantastic.com"]
  spec.summary       = "Gotcha. Gotcha where I want cha."
  spec.description   = "A Slack bot for real life introductions"
  spec.homepage      = "http://github.com/jwright/gotcha-bot"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.1"

  spec.add_runtime_dependency("activerecord")
  spec.add_runtime_dependency("faye-websocket")
  spec.add_runtime_dependency("rake")
  spec.add_runtime_dependency("slack-ruby-client")
end
