require 'rails/railtie'

#module ActiveModel
#  class Railtie < Rails::Railtie
#    generators do |app|
#      Rails::Generators.configure!(app.config.generators)
#      require "generators/resource_override"
#    end
#  end
#end

module Rendition
  class Railtie < Rails::Railtie

    ##
    # Decorators are loaded in
    # => at app boot in non-development environments
    # => after each request in the development environment
    #
    # This is necessary because we might never explicitly reference
    # Decorator constants.
    #
    config.to_prepare do
      ::Rendition::System.load_app_local_presenters
    end

    ##
    # The `app/decorators` path is eager loaded
    #
    # This is the standard "Rails Way" to add paths from which constants
    # can be loaded.
    #
    config.after_initialize do |app|
      app.config.paths.add 'app/presenters', :eager_load => true
    end

    initializer "rendition.extend_action_controller_base" do |app|
      ActiveSupport.on_load(:action_controller) do
        Rendition::System.setup(:action_controller)
      end
    end

    initializer "rendition.extend_action_mailer_base" do |app|
      ActiveSupport.on_load(:action_mailer) do
        Rendition::System.setup(:action_mailer)
      end
    end

    console do
      require 'action_controller/test_case'
      #ApplicationController.new.set_current_view_context
      #Rendition::ViewContext.current.controller.request ||= ActionController::TestRequest.new
      #Rendition::ViewContext.current.request            ||= Rendition::ViewContext.current.controller.request
      #Rendition::ViewContext.current.params             ||= {}
    end
  end
end