module Mutations
  class UpdateLibraryName < BaseMutation
    # arguments passed to the `resolve` method
    argument :id, ID, required: true

    # return type from the mutation
    type Types::LibraryType

    def resolve(id:)
      context[:current_user].libraries.find!(id: id) 
    end
  end
end