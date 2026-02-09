module ApplicationHelper
  def sidebar_categories
    Category.order(:name)
  end
end
