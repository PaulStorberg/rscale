class CloudflareMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['HTTP_CF_VISITOR']
      scheme = JSON.parse(env['HTTP_CF_VISITOR'])['scheme'] rescue nil
      env['HTTP_X_FORWARDED_PROTO'] = scheme if scheme
    end
    
    if env['HTTP_CF_CONNECTING_IP']
      env['REMOTE_ADDR'] = env['HTTP_CF_CONNECTING_IP']
    end
    
    @app.call(env)
  end
end 