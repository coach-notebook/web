class List < ViewComponent::Base
  def initialize(collection:, link: nil)
    @collection = collection
    @link = link
  end
end
