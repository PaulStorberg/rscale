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

  # SSL options
  config.ssl_options = { 
    redirect: { 
      status: 308
    },
    hsts: { 
      subdomains: true,
      preload: true,
      expires: 1.year
    }
  }

  # Trust Cloudflare's SSL termination
  config.action_dispatch.trusted_proxies = [
    IPAddr.new('103.21.244.0/22'),
    IPAddr.new('103.22.200.0/22'),
    IPAddr.new('103.31.4.0/22'),
    IPAddr.new('104.16.0.0/13'),
    IPAddr.new('104.24.0.0/14'),
    IPAddr.new('108.162.192.0/18'),
    IPAddr.new('131.0.72.0/22'),
    IPAddr.new('141.101.64.0/18'),
    IPAddr.new('162.158.0.0/15'),
    IPAddr.new('172.64.0.0/13'),
    IPAddr.new('173.245.48.0/20'),
    IPAddr.new('188.114.96.0/20'),
    IPAddr.new('190.93.240.0/20'),
    IPAddr.new('197.234.240.0/22'),
    IPAddr.new('198.41.128.0/17'),
    IPAddr.new('2400:cb00::/32'),
    IPAddr.new('2606:4700::/32'),
    IPAddr.new('2803:f800::/32'),
    IPAddr.new('2405:b500::/32'),
    IPAddr.new('2405:8100::/32'),
    IPAddr.new('2c0f:f248::/32'),
    IPAddr.new('2a06:98c0::/29')
  ]

  # Host configuration
  config.hosts << "r-scale.com"
  config.hosts << "www.r-scale.com"

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
