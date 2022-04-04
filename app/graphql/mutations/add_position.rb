module Mutations
  class AddPosition < BaseMutation

    argument :playId, ID, required: true
    argument :phaseId, ID, required: true 
    argument :side, Types::Enums::Side, required: true 
    argument :position, String, required: true 

     type Types::PlayType
  end
end