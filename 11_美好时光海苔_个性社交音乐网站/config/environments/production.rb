Rails.application.configure do
  
  config.cache_classes = true


  config.eager_load = true

  # 显示所有的出错报告和缓存信息
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true


  # 静止静态服务
  config.serve_static_assets = false

  # 压缩css和js
  config.assets.js_compressor = :uglifier

  config.assets.compile = false

  config.assets.digest = true

  config.log_level = :info


  config.cache_store = :dalli_store

  config.i18n.fallbacks = true


  config.active_support.deprecation = :notify


  config.log_formatter = ::Logger::Formatter.new


  config.active_record.dump_schema_after_migration = false
  config.assets.raise_runtime_errors = true
  config.action_mailer.default_url_options = { host: 'tinger.heroku.com' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            'your_email',
    password:              'your_email_password',
    authentication:       'plain',
    enable_starttls_auto: true     
  }
end
