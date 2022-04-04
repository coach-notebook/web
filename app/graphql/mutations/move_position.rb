require 'securerandom'

module Mutations
  class MovePosition < BaseMutation

    # arguments passed to the `resolve` method
    argument :playId, ID, required: true
    argument :phaseId, ID, required: true 
    argument :position, String, required: true 
    argument :x, Float, required: true
    argument :y, Float, required: true

    # return type from the mutation
    type Types::PlayType

    def resolve(playId:, phaseId:, playerId:, x: , y: )
      play = Play.find(playId)
      Rails.logger.info "xxx ---> Moving #{playerId} to #{x}, #{y} on #{playId} - #{phaseId}"
      if play.library.user_id === context[:current_user].id
        phases = play.phases
        phases.each do |phase| 
            if phase['id'] === phaseId
                phase['players'].each do |player|
                    if player['id'] === playerId
                        player.merge!({ "x": x, "y":y })
                    end
                end
            end
        end
        play.update(phases: phases)
      end
      return play
    end
  end
end