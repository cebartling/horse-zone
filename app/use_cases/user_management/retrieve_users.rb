require_relative 'validators'
require_relative 'pre_conditions'

module UserManagement

  class RetrieveUsersInput
    include Virtus.model

  end

  class RetrieveUsersCommand

    def initialize(user)
      @user = user
    end

    def execute(params)
      User.all
    end

  end

  class RetrieveUsers
    include UseCase

    def initialize(user)
      input_class(RetrieveUsersInput)
      step(RetrieveUsersCommand.new(user))
    end
  end

end