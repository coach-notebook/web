# == Schema Information
#
# Table name: matches
#
#  id         :uuid             not null, primary key
#  played_at  :datetime
#  opposition :string
#  result     :string
#  home_team  :boolean
#  team_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Match, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
