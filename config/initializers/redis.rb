if Rails.env.production?
  SENTINELS = ENV['SENTINEL_HOSTS'].split(' ').map! do |host|
    { host: host, port: ENV['SENTINEL_PORT'] }
  end

  Redis.current = Redis.new(url: ENV['SENTINEL_URL'],
                            sentinels: SENTINELS,
                            role: :master)
else
  Redis.current = Redis.new(url: ENV['REDIS_URL'],
                            port: ENV['REDIS_PORT'],
                            db: ENV['REDIS_DB'])
end