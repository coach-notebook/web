class Library < ApplicationRecord
  belongs_to :user

  has_many :plays
  has_many :drills
end
