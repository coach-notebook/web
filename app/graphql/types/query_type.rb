module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :libraries, [LibraryType], null: false
    field :teams, [TeamType], null: false 

    field :team, TeamType, null: false do 
      argument :id, ID
    end
    
    field :library, LibraryType, null: false do
      argument :id, ID
    end
    
    field :play, PlayType, null: false do
      argument :id, ID
    end
    
    field :drill, DrillType, null: false do
      argument :id, ID
    end

    field :player, PlayerType, null: false do
      argument :id, ID
    end

    def teams
      context[:current_user].teams 
    end

    def libraries
      context[:current_user].libraries
    end

    def library(id:)
      context[:current_user].libraries.find(id)
    end

    def team(id:)
      context[:current_user].teams.find(id)
    end

    def play(id:)
      Play.find(id)
    end

    def drill(id: )
      Drill.find(id)
    end

    def player(id: )
    end
  end
end
