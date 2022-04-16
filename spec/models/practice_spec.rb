# == Schema Information
#
# Table name: practices
#
#  id          :uuid             not null, primary key
#  practice_at :datetime
#  squad_id    :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  review      :string
#
require 'rails_helper'

RSpec.describe Practice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
