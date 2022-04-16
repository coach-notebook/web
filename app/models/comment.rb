# == Schema Information
#
# Table name: comments
#
#  id               :uuid             not null, primary key
#  user_id          :uuid             not null
#  commentable_type :string           not null
#  commentable_id   :uuid             not null
#  body             :text
#  tags             :string           default([]), is an Array
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Comment < ApplicationRecord
  include AccessControlled

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true

  acts_as_taggable
end
