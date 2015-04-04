module TenantManagement

  NewTenantValidator = UseCase::Validator.define do
    validates_presence_of :email_address
    validates_presence_of :password
  end

  SignInTenantValidator = UseCase::Validator.define do
    validates_presence_of :email_address
    validates_presence_of :password
  end

  UpdateTenantValidator = UseCase::Validator.define do
    validates_presence_of :id
  end

  DeleteExistingTenantValidator = UseCase::Validator.define do
    validates_presence_of :id
  end

end