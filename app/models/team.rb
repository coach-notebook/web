# == Schema Information
#
# Table name: teams
#
#  id         :uuid             not null, primary key
#  name       :string
#  squad_id   :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Team < ApplicationRecord
  include AccessControlled

  belongs_to :squad
  has_many :players
  has_many :matches
end
