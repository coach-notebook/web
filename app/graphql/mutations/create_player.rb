module Mutations
  class CreatePlayer < BaseMutation
        # arguments passed to the `resolve` method
    argument :team_id, ID, required: true
    argument :name, String, required: true

    # return type from the mutation
    type Types::PlayerType

    def resolve(name: nil, team_id: nil)
      team = context[:current_user].teams.find(team_id)
      team.players.create(name: name)
    end
  end
end