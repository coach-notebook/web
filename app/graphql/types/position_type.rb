# frozen_string_literal: true

module Types
  class PositionType < Types::BaseObject
    field :id, ID, null: false
    field :x, Float
    field :y, Float
    field :position, String
    field :side, Types::Enums::Side
  end
end