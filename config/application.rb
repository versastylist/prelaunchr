require File.expand_path('../boot', __FILE__)
require 'rails/all'
require 'csv'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Prelaunch
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.active_job.queue_adapter = :delayed_job

    #config.action_mailer.default_url_options = { host: "192.168.0.103:3000" }
    config.action_mailer.default_url_options = { host: "http://versastylist-prelaunchr.herokuapp.com" }

=begin
    config.action_mailer.smtp_settings = {
      address:              'smtp.mandrillapp.com',
      port:                 587,
      user_name:            ENV["MANDRILL_USERNAME"],
      password:             ENV["MANDRILL_APIKEY"],
      authentication:       :login,
      enable_starttls_auto: true
    }
=end

    config.action_mailer.smtp_settings = {
      address:              'w2pf-d2fg.accessdomain.com',
      port:                 587,
      user_name:            ENV["VERSASTYLIST_USERNAME"],
      password:             ENV["VERSASTYLIST_PASS"],
      authentication:       :login,
      enable_starttls_auto: true
    }
    
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
