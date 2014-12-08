module UserManagement
  NewUserValidator = UseCase::Validator.define do
    validates_presence_of :email
    validates_presence_of :password
  end
end