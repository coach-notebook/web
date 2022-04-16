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
  belongs_to :player
  belongs_to :match
end
