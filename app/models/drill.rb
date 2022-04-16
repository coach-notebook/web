# == Schema Information
#
# Table name: drills
#
#  id                :uuid             not null, primary key
#  user_id           :uuid             not null
#  library_id        :uuid             not null
#  name              :string
#  body              :text
#  duration_minutes  :integer
#  tags              :string           default([]), is an Array
#  number_of_players :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  variations        :string           default([]), is an Array
#  keys              :string           is an Array
#  goals             :string           is an Array
#
class Drill < ApplicationRecord
  include AccessControlled
  include Commentable

  acts_as_taggable

  belongs_to :library
  belongs_to :user

  has_many :practice_drills

  def self.tags
    ["mid-range-shot",
      "attacking-the-basket",
      "one-on-one-defence",
      "overplay",
      "defensive-slides",
      "quick-feet",
      "court-speed",
      "handles"]
  end
end
