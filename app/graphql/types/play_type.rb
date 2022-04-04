# frozen_string_literal: true

module Types
  class PlayType < Types::BaseObject
    field :id, ID, null: false
    field :library, Types::LibraryType, null: false
    field :court, Types::Enums::Court, null: false
    field :name, String, null: false
    field :notes, String
    field :phases, [Types::PhaseType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
