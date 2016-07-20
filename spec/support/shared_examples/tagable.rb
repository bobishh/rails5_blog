require 'rails_helper'

shared_examples :tagable do
  it { is_expected.to have_many :tags }
  it { is_expected.to have_many :models_tags }
end
