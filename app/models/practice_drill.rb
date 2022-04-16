# == Schema Information
#
# Table name: practice_drills
#
#  id          :uuid             not null, primary key
#  practice_id :uuid             not null
#  drill_id    :uuid             not null
#  position    :integer
#  run_at      :datetime
#  variation   :string
#  rating      :integer          default(0)
#
class PracticeDrill < ApplicationRecord
  include AccessControlled

  belongs_to :practice
  belongs_to :drill
end
