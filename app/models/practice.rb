# == Schema Information
#
# Table name: practices
#
#  id          :uuid             not null, primary key
#  practice_at :datetime
#  squad_id    :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  review      :string
#
class Practice < ApplicationRecord
  belongs_to :squad
  has_many :practice_drills
  has_many :drills, through: :practice_drills

  def rating
    practice_drills.map(&:rating).sum / practice_drills.count
  end

  def past?
    practice_at < Time.now
  end
end
