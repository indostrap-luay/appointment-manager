Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like nginx, varnish or squid.
  # config.action_dispatch.rack_cache = true

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = false

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  # config.assets.compile = false
  config.assets.paths << Rails.root.join("app", "assets", "fonts")
  config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
  config.assets.precompile += %w( application.css style.css.less bootstrap_and_overrides.css.less scaffolds.css.less)

  # config.assets.paths << Rails.root.join("app", "assets", "fonts")
  # config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
  # config.assets.precompile += %w( chosen.css v1/bootstrap.css v1/dashboard.css v1/dashboard_ext1.css v1/dataTables.bootstrap.css v1/datepicker.min.css
  #   v1/global_old.css v1/jquery-ui.css v1/jquery.jorgchart.css v1/jquery.tagsinput.css v1/main.css v1/merge.css v1/override.css v1/style.css v1/style_main.css
  #   bootstrap-wysihtml5.css bootstrap3-wysiwyg5.css

  #   v1/app.js v1/bootstrap.min.js v1/datepicker.js v1/function.js v1/html5shiv.js v1/ie8-responsive-file-warning.js v1/jquery-1.11.0.min.js
  #   v1/jquery-ui.js v1/jquery.dataTables.js v1/jquery.min.js v1/jquery.tagsinput.js v1/main.js
  #   v1/mcz3gag.js v1/respond.min.js v1/script.js v1/typeahead.bundle.min.js

  #   core/bootstrap3-typeahead.min.js core/chosen.jquery.min.js core/jquery.geocomplete.min.js core/jquery.jorgchart.js core/jstz.js
  #   core/highchart/exporting.js core/highchart/highcharts.js core/prettify.js core/prettify.js core/wysihtml5-0.3.0.js
  #   core/bootstrap3-wysihtml5.js
  #    )

  # Generate digests for assets URLs.
  config.assets.digest = true

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Set to :debug to see everything in the log.
  config.log_level = :info

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = "http://assets.example.com"

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Disable automatic flushing of the log to improve performance.
  # config.autoflush_log = false

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: "facilgo.com" }
  config.action_mailer.smtp_settings = {
    address: "smtp.mandrillapp.com",
    port: 587,
    domain: "facilgo.com",
    enable_starttls_auto: :true,
    user_name: "luay@41studio.com",
    password: "53bF8SWY1DeaUjKjWgF1fQ"
  }

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
