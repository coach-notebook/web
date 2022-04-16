# == Schema Information
#
# Table name: players
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :uuid
#
class Player < ApplicationRecord
  include AccessControlled

  belongs_to :team, optional: true
  belongs_to :squad, optional: true

  has_many :appearances
  has_many :matches, through: :appearances
  has_many :comments, as: :commentable

  validates :name, presence: true
end
