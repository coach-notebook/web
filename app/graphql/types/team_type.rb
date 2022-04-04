# frozen_string_literal: true

module Types
  class TeamType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :competition, String
    field :season, String
    field :user, Types::UserType
    field :libraries, [Types::LibraryType]
    field :players, [Types::PlayerType]
    
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
