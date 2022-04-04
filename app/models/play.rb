class Play < ApplicationRecord
  belongs_to :library

  enum court: %i[full half]
end
