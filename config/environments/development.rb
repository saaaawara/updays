Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load


  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # for email
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = {  host: 'localhost', port: 3000 }
  # config.action_mailer.default_url_options = {  host: '10.75.220.124', port: 3000 }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    port:                 587,
    address:              'smtp.gmail.com',
    # address: 'smtp.office365.com',
    domain:               'smtp.gmail.com',
    user_name:            'sawara04.o@gmail.com',
    # user_name: 'ogasawara.kyoji.17@shizuoka.ac.jp',
    password:             'gjhtjzbsaxvijgna',
    # password: 'fj67zi99',
    authentication:       'plain',
    # authentication: 'login',
    enable_starttls_auto: true
  }

  # config.middleware.use ExceptionNotification::Rack,
  # email: {
  #   deliver_with:         :deliver,
  #   email_prefix:         '[Email Prefix]',
  #   sender_address:       %{<sawara04.o@gmail.com>},
  #   exception_recipients: %w{'sawara04.o@gmail.com'}
  # }

  # config.action_mailer.perform_deliveries = true

end
