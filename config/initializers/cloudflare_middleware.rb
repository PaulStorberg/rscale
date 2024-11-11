class CloudflareMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    if cloudflare_request?(env)
      env['HTTP_X_FORWARDED_PROTO'] = env['HTTP_CF_VISITOR'].match(/"scheme":"(http|https)"/).try(:[], 1) if env['HTTP_CF_VISITOR']
      env['REMOTE_ADDR'] = env['HTTP_CF_CONNECTING_IP'] if env['HTTP_CF_CONNECTING_IP']
    end
    
    @app.call(env)
  end

  private

  def cloudflare_request?(env)
    env['HTTP_CF_RAY'].present?
  end
end 