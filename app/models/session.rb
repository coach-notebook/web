class Session < ApplicationRecord
  belongs_to :user

  after_create :create_token

  def create_token
    update(token: JWT.encode({user_id: user.id}, ""))
  end
end
