# == Schema Information
#
# Table name: access_controls
#
#  id                     :uuid             not null, primary key
#  user_id                :uuid             not null
#  access_controlled_type :string           not null
#  access_controlled_id   :uuid             not null
#  suspended_at           :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class AccessControl < ApplicationRecord
  default_scope -> { where(suspended_at: nil) }
  belongs_to :user
  belongs_to :access_controlled, polymorphic: true
end
