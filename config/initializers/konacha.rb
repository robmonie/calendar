Konacha.configure do |config|
  # config.spec_dir     = "spec/javascripts"
  # config.spec_matcher = /_spec\./
  # config.driver       = :selenium
  config.stylesheets  = %w(clinic_app)
end if defined?(Konacha)