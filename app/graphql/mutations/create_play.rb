module Mutations
  class CreatePlay < BaseMutation
    # arguments passed to the `resolve` method
    argument :library_id, ID, required: true
    argument :name, String, required: true
    argument :court, Types::Enums::Court, required: true

    # return type from the mutation
    type Types::PlayType

    def resolve(library_id: nil, name: nil, court: nil)
      context[:current_user].libraries.find(library_id).plays.create(name: name, court: court) 
    end
  end
end