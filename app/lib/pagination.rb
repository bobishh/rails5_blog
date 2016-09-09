# simple pagination module
module Pagination
  private

  def page(params)
    (params[:page] || 1).to_i
  end

  def next_page(params)
    page(params).to_i + 1
  end

  def paginate(scope, page, per_page: 10)
    to, from = pagination_range(per_page, page)
    scope.limit(to).offset(from)
  end

  def pagination_range(size, page)
    [(page - 1) * size + size, (page - 1) * size]
  end
end
