# == Schema Information
#
# Table name: matches
#
#  id         :uuid             not null, primary key
#  played_at  :datetime
#  opposition :string
#  result     :string
#  home_team  :boolean
#  team_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Match < ApplicationRecord
  include AccessControlled
  include Commentable

  acts_as_taggable

  belongs_to :team

  has_many :appearances
  has_many :players, through: :appearances
end
