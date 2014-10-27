uri = if Rails.env.development?
        URI.parse 'redis://localhost:6379/'
      else
        URI.parse ENV['REDIS_URL']
      end

$redis = Redis.new(:url => uri)
