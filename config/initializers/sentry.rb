if ENV['SENTRY_DSN'].present?
  Raven.configure do |config|
    config.environments = %w[ production ]
    config.dsn = ENV['SENTRY_DSN']
    config.excluded_exceptions += [
      'ActionController::RoutingError',
      'ActiveRecord::RecordNotFound'
    ]

    config.async = lambda { |event| SentryJob.perform_later(event) }
  end
end
