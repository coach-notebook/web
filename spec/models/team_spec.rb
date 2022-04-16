# == Schema Information
#
# Table name: teams
#
#  id         :uuid             not null, primary key
#  name       :string
#  squad_id   :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Team, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
