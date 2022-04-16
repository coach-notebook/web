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
  belongs_to :team
  has_many :appearances
  has_many :matches, through: :appearances

  validates :name, presence: true
end
