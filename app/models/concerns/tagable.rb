# adds tags to any model (polymorphic)
module Tagable
  extend ActiveSupport::Concern

  included do
    has_many :models_tags, as: :model
    has_many :tags, through: :models_tags, as: :model
    scope :with_tags, -> { eager_load(:tags) }
  end
end
