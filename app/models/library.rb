# == Schema Information
#
# Table name: libraries
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Library < ApplicationRecord
  include AccessControlled
  include Commentable

  acts_as_taggable

  validates :name, presence: true

  belongs_to :user

  has_many :plays
  has_many :drills
end
