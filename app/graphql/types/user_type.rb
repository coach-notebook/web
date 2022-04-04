# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email_address, String, null: false
    field :teams, [Types::TeamType]
    field :libraries, [Types::LibraryType]
  end
end
