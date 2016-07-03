require 'rails_helper'

RSpec.describe "TenantUserRoles", type: :request do
  describe "GET /tenant_user_roles" do
    it "works! (now write some real specs)" do
      get tenant_user_roles_path
      expect(response).to have_http_status(200)
    end
  end
end
