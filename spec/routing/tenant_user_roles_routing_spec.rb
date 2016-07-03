require "rails_helper"

RSpec.describe TenantUserRolesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tenant_user_roles").to route_to("tenant_user_roles#index")
    end

    it "routes to #new" do
      expect(:get => "/tenant_user_roles/new").to route_to("tenant_user_roles#new")
    end

    it "routes to #show" do
      expect(:get => "/tenant_user_roles/1").to route_to("tenant_user_roles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tenant_user_roles/1/edit").to route_to("tenant_user_roles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tenant_user_roles").to route_to("tenant_user_roles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tenant_user_roles/1").to route_to("tenant_user_roles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tenant_user_roles/1").to route_to("tenant_user_roles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tenant_user_roles/1").to route_to("tenant_user_roles#destroy", :id => "1")
    end

  end
end
