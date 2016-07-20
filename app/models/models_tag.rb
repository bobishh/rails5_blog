class ModelsTag < ApplicationRecord
  belongs_to :tag
  belongs_to :model, polymorphic: true
end
