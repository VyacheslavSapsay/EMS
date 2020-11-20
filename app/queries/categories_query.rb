class CategoriesQuery < ApplicationQuery
  default_relation Category.all

  def perform
    query order(:created_at)
  end

end
