module Mutations
  class AddPhase < BaseMutation
    require 'securerandom'


    # arguments passed to the `resolve` method
    argument :id, ID, required: true

    # return type from the mutation
    type Types::PlayType

    def resolve(id:)
      play = Play.find(id)
      if play.library.user_id === context[:current_user].id
        play.phases << { 
            id: SecureRandom.uuid,
            index: play.phases.count, 
            players: [] 
        }
        play.save
      end
      return play
    end
  end
end