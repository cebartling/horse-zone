module TenantManagement

  NewTenantValidator = UseCase::Validator.define do
    validates_presence_of :name
  end

  UpdateTenantValidator = UseCase::Validator.define do
    validates_presence_of :id
  end

  DeleteExistingTenantValidator = UseCase::Validator.define do
    validates_presence_of :id
  end

end