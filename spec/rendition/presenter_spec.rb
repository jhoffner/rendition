require 'spec_helper'

describe Rendition::Presenter do
  let(:app_controller_instance) {ApplicationController.new}
  let(:presenter) { app_controller_instance.product }

  it "should have its model attribute set to the underlying model" do
    presenter.model.is_a?(Product).should be_true
  end

  it "should pass-through to the decorated model" do
    presenter.name.empty?.should be_false
  end

  it "should implement #context" do
    presenter.view_context.should_not be_nil
  end

  it "should implement #model" do
    presenter.model.should_not be_nil
  end

  it "should provide access to presenter specific methods" do
    presenter.name_and_id.should == "#{presenter.name}_#{presenter.id}"
  end

  describe "nested presenters" do
    let(:nested_presenters) { presenter.related_products.presenters }

    it "should provide the ability to load child presenters on arrays within the model" do
      nested_presenters.first.is_a?(Product::Presenter).should be_true
    end

    it "should have their #parent_presenter attr set" do
      nested_presenters.first.parent_presenter.should == presenter
    end
  end


  describe "specifying a non-default presenter type" do
    let(:alt_presenter) {alt_presenter = app_controller_instance.presenter(:alt, presenter)}

    it "should return itself as a different type of presenter if manually specified" do
      alt_presenter.is_a?(Product::AltPresenter).should be_true
    end

  end
end