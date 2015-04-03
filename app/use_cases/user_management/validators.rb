module UserManagement

  NewUserValidator = UseCase::Validator.define do
    validates_presence_of :email_address
    validates_presence_of :password
  end

  SignInUserValidator = UseCase::Validator.define do
    validates_presence_of :email_address
    validates_presence_of :password
  end

  UpdateUserValidator = UseCase::Validator.define do
    validates_presence_of :id
  end

  DeleteExistingUserValidator = UseCase::Validator.define do
    validates_presence_of :id
  end

end