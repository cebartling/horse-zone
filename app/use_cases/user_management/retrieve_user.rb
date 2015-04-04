require_relative 'validators'
require_relative 'pre_conditions'

module UserManagement

  class RetrieveUserInput
    include Virtus.model

    attribute :id, Integer
  end

  class RetrieveUserCommand
    def execute(params)
      if params.id
        User.find(params.id)
      end
    end
  end

  class RetrieveUser
    include UseCase

    def initialize()
      input_class(UserManagement::RetrieveUserInput)
      add_pre_condition(UserManagement::UserExistsPrecondition.new)
      step(UserManagement::RetrieveUserCommand.new)
    end
  end
end