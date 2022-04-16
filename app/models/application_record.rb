class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_s
    return name if respond_to?(:name)
    super
  end
end
