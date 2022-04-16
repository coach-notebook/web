class Rating < ViewComponent::Base
  def initialize(rating:, url: nil)
    @rating = rating
    @url = url
  end
end
