class Comment < ApplicationRecord
  include AccessControlled

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  acts_as_taggable_on :tags
end
