class Post < ApplicationRecord
  # individual post cell
  class Cell < Cell::Concept
    property :title
    property :content
    property :created_at

    def show
      render
    end

    private

    def created_at
      super.strftime 'Created at %d.%m.%Y %T'
    end

    def html_content
      ::Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true).render(content)
    end

    def back_link
      link_to '< see all', posts_path, class: 'post__link'
    end
  end
end
