# == Schema Information
#
# Table name: users
#
#  id            :uuid             not null, primary key
#  email_address :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class User < ApplicationRecord
  has_many :access_controls
  has_many :sessions

  has_secure_password

  validates :email_address, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email"}
end
