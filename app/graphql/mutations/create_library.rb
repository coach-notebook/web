module Mutations
  class CreateLibrary < BaseMutation
    # arguments passed to the `resolve` method
    argument :name, String, required: true

    # return type from the mutation
    type Types::LibraryType

    def resolve(name:)
      context[:current_user].libraries.create!( name: name ) 
    end
  end
end