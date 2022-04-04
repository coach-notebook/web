# frozen_string_literal: true

module Types
  class LibraryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :notes, String
    field :team, Types::TeamType, null: false
    field :user, Types::UserType, null: false
    field :plays, [Types::PlayType], null: false
    field :drills, [Types::DrillType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
