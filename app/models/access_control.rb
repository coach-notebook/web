class AccessControl < ApplicationRecord
  default_scope -> { where(suspended_at: nil) }
  belongs_to :user
  belongs_to :access_controlled, polymorphic: true
end
