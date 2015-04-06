module UserManagement
  class SignInUserInput
    include Virtus.model

    attribute :email_address, String
    attribute :password, String
  end
end