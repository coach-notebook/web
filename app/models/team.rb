class Team < ApplicationRecord
  has_many :libraries
  has_many :players

  belongs_to :user

  def to_s
    name
  end
end
