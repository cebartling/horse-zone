require 'rails_helper'

RSpec.describe "TenantLocations", type: :request do
  describe "GET /tenant_locations" do
    it "works! (now write some real specs)" do
      get tenant_locations_path
      expect(response).to have_http_status(200)
    end
  end
end
