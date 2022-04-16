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

  validates :practice_at, presence: true

  scope :future, -> { where("practice_at < ?", Time.now) }
  scope :past, -> { where("practice_at < ?", Time.now) }

  def rating
    practice_drills.map(&:rating).sum / practice_drills.count
  rescue
    0
  end

  def copy_drills_from(other_practice_id)
    if @original_practice = Practice.find_by(id: other_practice_id)
      @original_practice.drills.each do |drill|
        self.practice_drills.create(drill: drill)
      end
    end
  end

  def past?
    practice_at < Time.now
  end
end
