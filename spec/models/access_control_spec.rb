# == Schema Information
#
# Table name: access_controls
#
#  id                     :uuid             not null, primary key
#  user_id                :uuid             not null
#  access_controlled_type :string           not null
#  access_controlled_id   :uuid             not null
#  suspended_at           :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'rails_helper'

RSpec.describe AccessControl, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
