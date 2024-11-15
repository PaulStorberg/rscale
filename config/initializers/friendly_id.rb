require 'friendly_id'

FriendlyId.defaults do |config|
  config.use :reserved
  config.reserved_words = %w(new edit index session login logout users admin)
end
