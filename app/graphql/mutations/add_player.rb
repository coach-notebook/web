require 'securerandom'

module Mutations
  class AddPlayer < BaseMutation

    # arguments passed to the `resolve` method
    argument :playId, ID, required: true
    argument :phaseId, ID, required: true 
    argument :side, Types::Enums::Side, required: true 
    argument :position, String, required: true 

    # return type from the mutation
    type Types::PlayType

    def resolve(playId:, phaseId:, side:, position: )
      play = Play.find(playId)
      if play.library.user_id === context[:current_user].id
        phases = play.phases
        phases.each do |phase| 
            Rails.logger.info "#{phase[:id]}/#{phaseId}"
            if phase['id'] === phaseId
                phase['players'] << { 
                    id: SecureRandom.uuid, 
                    x: 0, 
                    y: 0, 
                    side: side, 
                    position: position
                }
            end
        end
        play.update(phases: phases)
      end
      return play
    end
  end
end