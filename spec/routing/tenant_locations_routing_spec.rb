require "rails_helper"

RSpec.describe TenantLocationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tenant_locations").to route_to("tenant_locations#index")
    end

    it "routes to #new" do
      expect(:get => "/tenant_locations/new").to route_to("tenant_locations#new")
    end

    it "routes to #show" do
      expect(:get => "/tenant_locations/1").to route_to("tenant_locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tenant_locations/1/edit").to route_to("tenant_locations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tenant_locations").to route_to("tenant_locations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tenant_locations/1").to route_to("tenant_locations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tenant_locations/1").to route_to("tenant_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tenant_locations/1").to route_to("tenant_locations#destroy", :id => "1")
    end

  end
end
