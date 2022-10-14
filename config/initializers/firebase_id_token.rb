FirebaseIdToken.configure do |config|
  case Rails.env
  when 'production' then
    config.redis = Redis.new(host: ENV['REDIS_URL'], port: 6379)
  else
    config.redis = Redis.new
  end

  config.project_ids = [ENV['FIREBASE_PROJECT_ID']]
end
