class Post < ApplicationRecord
  # posts list cell
  class List < ::Cell::Concept
    include ::Pagination
    DEFAULT_PER_PAGE = 5

    def show
      (content_tag('ul', class: 'posts__list posts') do
         posts_list_items
       end +
       next_page_button)
    end

    def replace
      %{ $('.posts__list').append("#{j(posts_list_items)}") }
    end

    def posts_list_items
      concept('post/preview', collection: posts)
    end

    private

    def next_page_button
      return if posts.blank? || posts.size < page_number * DEFAULT_PER_PAGE
      link_to 'next page', posts_path(page: page(params) + 1),
              class: 'button posts__next'
    end

    def page_number
      params[:page].to_i > 0 ? params[:page].to_i : 1
    end

    def posts
      paginate(Post, page(params), per_page: DEFAULT_PER_PAGE)
    end
  end
end
