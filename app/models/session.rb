# == Schema Information
#
# Table name: sessions
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Session < ApplicationRecord
  belongs_to :user

  after_create :create_token

  def create_token
    update(token: JWT.encode({user_id: user.id}, ""))
  end
end
