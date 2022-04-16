require "active_support/concern"

module AccessControlled
  extend ActiveSupport::Concern

  included do
    belongs_to :access_controlled, polymorphic: true, optional: true

    scope :accessible_to, ->(user) {
            joins("INNER JOIN access_controls ON access_controlled_id = #{table_name}.id")
              .where("access_controls.suspended_at IS NULL")
              .where("access_controls.user_id = ?", user.id)
          }
  end
end
