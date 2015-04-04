require_relative 'validators'
require_relative 'pre_conditions'

module UserManagement
  class UpdateExistingUserInput
    include Virtus.model

    attribute :email_address, String
    attribute :first_name, String
    attribute :last_name, String
    attribute :id, String
  end

  class UpdateExistingUserCommand
    def execute(params)
      user = User.find(params.id)
      if user
        user.email_address = params.email_address if params.email_address
        user.first_name = params.first_name if params.first_name
        user.last_name = params.last_name if params.last_name
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
