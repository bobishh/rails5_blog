class Post < ApplicationRecord
  # post creation operation
  class Create < Trailblazer::Operation
    include Model
    model Post, :create

    contract do
      property :title
      property :content

      validates :title, presence: true
      validates :content, length: { in: 4..1000 }
    end

    def process(params)
      validate(params[:post], &:save)
    end
  end
end
