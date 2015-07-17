require File.expand_path('../boot', __FILE__)

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CeltabInventory
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    config.time_zone = 'Brasilia'

    config.i18n.load_path += Dir[Rails.root.join("config/locales/**/*.yml").to_s]
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, 'pt-BR', :es, :de]
    config.i18n.enforce_available_locales = false
    config.encoding = "utf-8"

    # config.active_record.whitelist_attributes = true
    config.action_controller.action_on_unpermitted_parameters = :raise

    # To re-enable this authenticity token for remote forms
    config.action_view.embed_authenticity_token_in_remote_forms = true

    # Disable the asset pipeline.
    config.assets.enabled = false
    # config.assets.css_compressor = :yui
    config.assets.css_compressor = :sass
    config.assets.js_compressor = :uglify

    Rails.root.join('vendor', 'assets', 'bower').to_s.tap do |bower_path|
      # config.sass.load_paths << bower_path
      config.assets.paths << bower_path
    end

    config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
