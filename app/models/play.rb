# == Schema Information
#
# Table name: plays
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  library_id :uuid
#  name       :string
#  notes      :text
#  court      :integer          default("full")
#  phases     :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Play < ApplicationRecord
  include AccessControlled

  belongs_to :library
  belongs_to :user

  enum court: %i[full half]
end
