# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console
                                                               ])

SimpleCov.start do
  add_filter '/spec/'
end

RSpec.configure do |config|
  config.after(:suite) do
  end
end
