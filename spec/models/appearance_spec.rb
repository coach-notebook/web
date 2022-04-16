# == Schema Information
#
# Table name: appearances
#
#  id         :uuid             not null, primary key
#  match_id   :uuid             not null
#  player_id  :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Appearance, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
