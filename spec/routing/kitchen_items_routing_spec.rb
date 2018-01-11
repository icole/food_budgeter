require "rails_helper"

RSpec.describe KitchenItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/kitchen_items").to route_to("kitchen_items#index")
    end

    it "routes to #new" do
      expect(:get => "/kitchen_items/new").to route_to("kitchen_items#new")
    end

    it "routes to #show" do
      expect(:get => "/kitchen_items/1").to route_to("kitchen_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/kitchen_items/1/edit").to route_to("kitchen_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/kitchen_items").to route_to("kitchen_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/kitchen_items/1").to route_to("kitchen_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/kitchen_items/1").to route_to("kitchen_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/kitchen_items/1").to route_to("kitchen_items#destroy", :id => "1")
    end

  end
end
