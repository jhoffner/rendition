module Rendition
  class System
    def self.app_local_presenter_glob
      'app/presenters/**/*_presenter.rb'
    end

    def self.load_app_local_presenters
      presenter_files = Dir[ "#{ Rails.root }/#{ app_local_presenter_glob }" ]
      presenter_files.each { |d| require_dependency d }
    end

    def self.setup(component)
      if component == :action_controller
        #ActionController::Base.send(:include, Rendition::ViewContextFilter)
        ActionController::Base.send(:include, Rendition::ActionSupport)
        #ActionController::Base.extend(Rendition::HelperSupport)
      elsif component == :action_mailer
        #ActionMailer::Base.send(:include, Rendition::ViewContextFilter)
        ActionMailer::Base.send(:include, Rendition::ActionSupport)
      end
    end
  end
end