# frozen_string_literal: true

require 'nokogiri'

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rubbit
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # rubocop:disable Rails/OutputSafety
    config.action_view.field_error_proc =
      proc do |html_tag, _|
        elements = Nokogiri::HTML::DocumentFragment.parse(html_tag)
        elements.css('.input').add_class(%w[input-error input-bordered])
        elements.to_s.html_safe
      end
    # rubocop:enable Rails/OutputSafety
  end
end
