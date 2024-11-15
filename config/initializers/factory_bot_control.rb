if defined?(FactoryBot)
  if Rails.env.test?
    FactoryBot.find_definitions
  else
    # Prevent factory loading in non-test environments
    def FactoryBot.find_definitions
      # No-op
    end
  end
end 