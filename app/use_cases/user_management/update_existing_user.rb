require_relative 'validators'
require_relative 'pre_conditions'

module UserManagement

  class UpdateExistingUserInput
    include Virtus.model

    attribute :email, String
    attribute :password, String
    attribute :id, Integer
  end

  class UpdateExistingUserCommand
    def execute(params)
      user = User.find(params.id)
      if user
        user.email = params.email if params.email
        user.password = params.password if params.password
        user.save!
      end
      user
    end
  end

  class UpdateExistingUser
    include UseCase

    def initialize
      input_class(UserManagement::UpdateExistingUserInput)
      add_pre_condition(UserManagement::UserExistsPrecondition.new)
      step(UserManagement::UpdateExistingUserCommand.new, validators: [UserManagement::UpdateUserValidator])
    end
  end
  
end
