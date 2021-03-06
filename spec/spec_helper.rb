# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require_relative '../app.rb'

require 'capybara'
require 'capybara/rspec'
require 'rake'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

Rake.application.load_rakefile

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [SimpleCov::Formatter::Console]
)

SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

Capybara.app = BlockchainApp
