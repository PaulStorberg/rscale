# Initialize FriendlyId
require 'friendly_id'
FriendlyId.defaults do |config|
  config.use :reserved
  config.reserved_words = %w(new edit index session login logout users admin)
end

# Initialize Rolify
require 'rolify'
Rolify.configure do |config|
  config.use_dynamic_shortcuts
end

# Initialize Devise
require 'devise' 