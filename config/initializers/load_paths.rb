Rails.application.config.before_initialize do
  # Add lib to autoload paths
  Rails.application.config.autoload_paths += [Rails.root.join('lib')]
end 