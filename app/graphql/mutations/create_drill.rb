module Mutations
  class CreateDrill < BaseMutation
    argument :library_id, ID, required: true
    argument :name, String, required: true
    argument :notes, String, required: true

    type Types::DrillType

    def resolve(library_id: nil, name: nil, notes: nil)
      library = context[:current_user].libraries.find(library_id)
      library.drills.create(name: name, notes: notes) 
    end
  end
end