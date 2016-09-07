class Post < ApplicationRecord
  # individual post cell
  class Cell < Cell::Concept
    def show
      render
    end

    def created_at
      l super
    end

    def back_link
      link_to '< see all', posts_path, class: 'post__link'
    end
  end
end
