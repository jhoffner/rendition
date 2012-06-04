
module Rendition
  module ActionSupport
    extend ActiveSupport::Concern

    module ClassMethods
      # @param [Symbol] name
      # @param [Block] block
      def expose_presenter(name, default_type = :default, &block)
        _expose_presenter_or_presenters(:presenter, name, default_type, &block)
      end

      # @param [Symbol] name
      # @param [Block] block
      def expose_presenters(name, default_type = :default, &block)
        _expose_presenter_or_presenters(:presenters, name, default_type, &block)
      end

      private

      def _expose_presenter_or_presenters(method_name, name, default_type, &block)
        default_exposure = begin self.default_exposure rescue nil end
        define_method name do |type = default_type, attributes = {}|
          @_resources ||= {}
          @_resources.fetch(name) do
            model = if block_given?
                      instance_eval(&block)
                    else
                      instance_exec(name, &default_exposure)
                    end

            @_resources[name] = send method_name, type, model, attributes
          end
        end

        define_method "#{name}=" do |value|
          @_resources ||= {}
          @_resources[name] = value
        end

        helper_method name
        hide_action name
      end
    end

    def presenter(type = :default, model = nil, attributes = {}, &block)
      Rendition::Presenter.presenter(self.view_context, type, model, attributes, &block)
    end

    def presenters(type = :default, models = nil, attributes = {}, &block)
      Rendition::Presenter.presenters(self.view_context, type, models, attributes, &block)
    end
  end
end