module Mutations
  class SetPlayNotes < BaseMutation
    # arguments passed to the `resolve` method
    argument :id, ID, required: true
    argument :notes, String, required: true

    # return type from the mutation
    type Types::PlayType

    def resolve(id:, notes:)
      play = Play.find(id)
      if play.library.user_id === context[:current_user].id
        play.update(notes: notes)
      end
      return play
    end
  end
end