class Post < ApplicationRecord
  # Post preview cell
  class Preview < ::Cell::Concept
    property :title
    property :created_at
    property :link

    def show
      render :preview
    end

    private

    def link
      link_to title, post_path(model),
              class: 'post__link', id: "post-#{model.id}"
    end

    def created_at
      super.strftime 'Created at %d.%m.%Y %T'
    end
  end
end
