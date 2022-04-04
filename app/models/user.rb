class User < ApplicationRecord
  has_many :sessions
  has_many :libraries
  has_many :teams
end
