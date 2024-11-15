require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rscale
  class Application < Rails::Application
    # Add this line at the top of the configuration
    config.root = File.expand_path('..', __dir__)
    
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Disable all credential-related functionality
    config.require_master_key = false
    config.read_encrypted_secrets = false
    config.credentials.content_path = nil
    config.credentials.key_path = nil
    
    # Use ENV variables
    config.secret_key_base = ENV['SECRET_KEY_BASE']

    # Add these lines
    config.generators do |g|
      g.test_framework nil
      g.factory_bot false
    end
    
    # Explicitly ignore spec directory in non-test environments
    unless Rails.env.test?
      config.paths.add 'spec', skip_eager_load: true, eager_load: false
      config.eager_load_paths -= [Rails.root.join('spec').to_s]
    end

    # Ensure proper loading order
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      if File.exist?(env_file)
        YAML.load(File.open(env_file)).each do |key, value|
          ENV[key.to_s] = value.to_s
        end
      end
    end

    # Disable factory loading in non-test environments
    unless Rails.env.test?
      config.paths['spec'] = []
      config.factory_bot.definition_file_paths = [] if defined?(FactoryBot)
    end
  end
end
