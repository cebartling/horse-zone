require_relative 'validators'
require_relative 'pre_conditions'

module UserManagement
  class RetrieveUsersInput
    include Virtus.model
  end

  class RetrieveUsersCommand
    def execute(_params)
      User.all
    end
  end

  class RetrieveUsers
    include UseCase

    def initialize
      input_class(RetrieveUsersInput)
      step(RetrieveUsersCommand.new)
    end
  end
end
