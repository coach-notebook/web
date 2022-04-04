# frozen_string_literal: true

module Types
  class DrillType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :library, Types::LibraryType, null: false
  end
end
