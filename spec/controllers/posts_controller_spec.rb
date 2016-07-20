require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:valid_attributes) { { title: 'SampleTitle', content: 'SupaContent' } }
  describe 'GET index' do
    before do
      Post.create!(valid_attributes)
      get :index
    end

    it 'returns OK status' do
      expect(response).to be_ok
    end
  end
  describe 'PUT index' do
    let(:subject) { response }
    it { is_expected.to be_ok }
  end
end
