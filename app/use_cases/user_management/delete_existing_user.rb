require_relative 'user_management'

module UserManagement
  class DeleteExistingUserInput
    include Virtus.model

    attribute :id, Integer
  end

  class DeleteExistingUserCommand
    def execute(params)
      User.delete(params.id)
    end
  end

  class DeleteExistingUser
    include UseCase

    def initialize
      input_class(UserManagement::DeleteExistingUserInput)
      add_pre_condition(UserManagement::UserExistsPrecondition.new)
      step(UserManagement::DeleteExistingUserCommand.new, validators: [UserManagement::DeleteExistingUserValidator])
    end
  end
end
