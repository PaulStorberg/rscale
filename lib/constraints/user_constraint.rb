class UserConstraint
  def matches?(request)
    request.env['warden'].authenticate? && request.env['warden'].user
  end
end
