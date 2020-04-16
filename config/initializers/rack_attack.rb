class Rack::Attack

  # `Rack::Attack` is configured to use the `Rails.cache` value by default,
  # but you can override that by setting the `Rack::Attack.cache.store` value
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  # Allow all local traffic
  safelist('allow-localhost') do |req|
    req.ip == '127.0.0.1' || req.ip == '::1'
  end

  # Allow an IP address to make 5 requests every 2 seconds
  throttle('req/ip', limit: 5, period: 5) do |req|
    req.ip unless req.path.start_with?('/assets')
  end

  # Send the following response to throttled clients
  self.throttled_response = lambda do |env|
    retry_after = (env['rack.attack.match_data'] || {})[:period]

    headers = {
        'Content-Type' => 'application/json',
        'Retry-After' => retry_after.to_s
    }

    response = {
        error: 'Throttle limit reached. Retry later.'
    }

    [429, headers, [response.to_json]]
  end

end