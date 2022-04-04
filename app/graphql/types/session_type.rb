# frozen_string_literal: true

module Types
  class SessionType < Types::BaseObject
    field :user, Types::UserType, null: false
    field :token, String, null: false
  end
end
