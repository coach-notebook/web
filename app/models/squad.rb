# == Schema Information
#
# Table name: squads
#
#  id          :uuid             not null, primary key
#  user_id     :uuid             not null
#  active      :boolean
#  name        :string
#  competition :string
#  season      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Squad < ApplicationRecord
  has_many :libraries
  has_many :players
  has_many :practices
  has_many :teams
  belongs_to :user

  validates :name, presence: true

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
end
