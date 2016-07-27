class PostPresenter < BasePresenter
  def created_at_timestamp
    created_at.strftime '%d.%m.%Y %T'
  end
end
