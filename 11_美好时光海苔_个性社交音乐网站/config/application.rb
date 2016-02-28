require File.expand_path('../boot', __FILE__)

require 'rails/all'


Bundler.require(*Rails.groups)

module Ting
  class Application < Rails::Application

    config.i18n.default_locale = "zh-CN"
    config.i18n.available_locales = [:en, 'zh-CN']
    I18n.enforce_available_locales = false
  end
end
