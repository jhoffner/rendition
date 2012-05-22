

require 'rendition/version'
require 'rendition/system'
require 'rendition/presenter'
require 'rendition/action_support'
#require 'rendition/lazy_helpers'
#require 'rendition/model_support'
#require 'rendition/helper_support'
require 'rendition/view_context'
require 'rendition/rspec_integration' if defined?(RSpec) and RSpec.respond_to?(:configure)
require 'rendition/railtie' if defined?(Rails)
