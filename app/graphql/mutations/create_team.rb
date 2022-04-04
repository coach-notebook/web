module Mutations
  class CreateTeam < BaseMutation
    # arguments passed to the `resolve` method
    argument :name, String, required: true
    argument :competition, String, required: true
    argument :season, String, required: true

    # return type from the mutation
    type Types::TeamType

    def resolve(name: nil, competition: nil, season:nil)
      context[:current_user].teams.create!( name: name, competition: competition, season: season) 
    end
  end
end