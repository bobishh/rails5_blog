# generic blog post model
class Post < ApplicationRecord
  include Tagable
  accepts_nested_attributes_for :tags, allow_destroy: true
end
