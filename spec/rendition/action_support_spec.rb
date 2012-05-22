require 'spec_helper'

describe Rendition::ActionSupport do
  let(:app_controller) { ApplicationController }
  let(:app_controller_instance) { app_controller.new }

  it "implements #presenter" do
    app_controller_instance.should respond_to(:presenter)
  end

  it "implements #presenters" do
    app_controller_instance.should respond_to(:presenters)
  end

  it "implements #expose_presenter" do
    app_controller.should respond_to(:expose_presenter)
  end

  it "implements #expose_presenters" do
    app_controller.should respond_to(:expose_presenters)
  end

  describe "expose_presenter" do
    let(:product) { app_controller_instance.product }

    it "should always return a presenter instance when the underlying model is available" do
      product.is_a?(Rendition::Presenter).should be_true
      product.is_a?(Product::Presenter).should be_true
    end
  end
end