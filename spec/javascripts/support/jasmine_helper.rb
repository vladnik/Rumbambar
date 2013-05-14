#Use this file to set/override Jasmine configuration options
#You can remove it if you don't need it.
#This file is loaded *after* jasmine.yml is interpreted.
#
#Example: using a different boot file.
Jasmine.configure do |config|
  config.browser = 'phantomjs'
  config.spec_path = 'assets'
end
