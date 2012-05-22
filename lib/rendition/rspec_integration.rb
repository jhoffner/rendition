module Rendition
  module PresenterExampleGroup
    extend ActiveSupport::Concern
    included { metadata[:type] = :presenter }
  end
end

RSpec.configure do |config|
  # Automatically tag specs in specs/Presenters as type: :presenter
  config.include Rendition::PresenterExampleGroup, :type => :presenter, :example_group => {
      :file_path => /spec[\\\/]Presenters/
  }

  # Specs tagged type: :presenter set the Rendition view context
  config.around do |example|
    if :presenter == example.metadata[:type]
      ApplicationController.new.set_current_view_context
      Rendition::ViewContext.current.controller.request ||= ActionController::TestRequest.new
      Rendition::ViewContext.current.request            ||= Rendition::ViewContext.current.controller.request
      Rendition::ViewContext.current.params             ||= {}
    end
    example.call
  end
end