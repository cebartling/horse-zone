require_relative 'validators'
require_relative 'pre_conditions'

module UserManagement

  class RetrieveUserInput
    include Virtus.model

    attribute :id, Integer
  end

  class RetrieveUserCommand

    def initialize(user)
      @user = user
    end

    def execute(params)
      User.find(params.id)
    end
  end

  class RetrieveUser
    include UseCase

    def initialize(user)
      input_class(UserManagement::RetrieveUserInput)
      step(UserManagement::RetrieveUserCommand.new(user))
    end
  end
end