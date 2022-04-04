module Mutations
  class SetPlayName < BaseMutation
    # arguments passed to the `resolve` method
    argument :id, ID, required: true
    argument :name, String, required: true

    # return type from the mutation
    type Types::PlayType

    def resolve(id:, name:)
      play = Play.find(id)
      if play.library.user_id === context[:current_user].id
        play.update(name: name)
      end
      return play
    end
  end
end