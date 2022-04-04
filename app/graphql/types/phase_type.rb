# frozen_string_literal: true

module Types
    class PhaseType < Types::BaseObject
        field :id, ID, null: false
        field :index, Integer, null: false
        field :possession, Integer
        field :positions, [Types::PositionType]
    end
end