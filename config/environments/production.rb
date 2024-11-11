# config/environments/production.rb
Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Default URL options
  config.action_mailer.default_url_options = { host: 'r-scale.com', protocol: 'https' }
  config.action_controller.default_url_options = { host: 'r-scale.com', protocol: 'https' }

  # Mailer settings
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            'noreply.rscale@gmail.com',
    password:             ENV['GMAIL_PASSWORD'],
    authentication:       'plain',
    enable_starttls_auto: true
  }

  # Eager load code on boot.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable serving static files from the `/public` folder by default.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :terser
  config.assets.compile = false

  # Store uploaded files on the local file system.
  config.active_storage.service = :amazon

  # Force SSL
  config.force_ssl = true

  # Trust Heroku's SSL termination
  config.action_dispatch.trusted_proxies = %w[127.0.0.1 ::1 10.0.0.0/8].map { |proxy| IPAddr.new(proxy) }

  # Use the lowest log level to ensure availability of diagnostic information.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job.
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "rscale_#{Rails.env}"

  config.action_mailer.perform_caching = false

  # Enable locale fallbacks for I18n.
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Enable request forgery protection
  config.action_controller.allow_forgery_protection = true
end
