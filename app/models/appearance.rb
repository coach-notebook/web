# == Schema Information
#
# Table name: appearances
#
#  id         :uuid             not null, primary key
#  match_id   :uuid             not null
#  player_id  :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Appearance < ApplicationRecord
  include AccessControlled
  include Commentable

  belongs_to :player
  belongs_to :match

  def starting_position
    Appearance.positions[self.read_attribute(:starting_position) - 1]
  rescue
    nil
  end

  def self.positions
    ["pg", "sg", "sf", "pf", "c", "bench"]
  end
end
