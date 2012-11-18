def app_path
  ENV['APP_BUNDLE_PATH'] || (defined?(APP_BUNDLE_PATH) && APP_BUNDLE_PATH)
end

def app_args
  app_args_by_processing_defaults
end

def app_defaults
  ENV['APP_DEFAULTS'] || (defined?(APP_DEFAULTS) && APP_DEFAULTS)
end

Given /^I launch the app$/ do
  # latest sdk and iphone by default
  launch_app app_path, {:clear_defaults => true, :set_defaults => app_defaults}
end


Given /^I launch the app using iOS (\d\.\d)$/ do |sdk|
  # You can grab a list of the installed SDK with sim_launcher
  # > run sim_launcher from the command line
  # > open a browser to http://localhost:8881/showsdks
  # > use one of the sdk you see in parenthesis (e.g. 4.2)
  launch_app app_path, {:sdk => sdk, :clear_defaults => true, :set_defaults => app_defaults}
end

Given /^I launch the app using iOS (\d\.\d) and the (iphone|ipad) simulator$/ do |sdk, version|
  launch_app app_path, {:sdk => sdk, :version => version, :clear_defaults => true, :set_defaults => app_defaults}
end
