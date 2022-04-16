class PageHeader < ViewComponent::Base
  def initialize(title:, subtitle: nil, link: nil)
    @title = title
    @subtitle = subtitle
    @link = link
  end
end
