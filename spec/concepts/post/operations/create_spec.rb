require 'rails_helper'

describe Post::Create do
  let(:post_params) do
    {
      post: {
        title: 'Sample Title',
        content: 'Sample content'
      }
    }
  end

  let(:subject) { described_class.(post_params).model }

  it 'is persisted when valid' do
    expect(subject).to be_persisted
    expect(subject.title).to eq(post_params[:post][:title])
  end

  context 'short content' do
    let(:short_desc_params) do
      a = post_params
      a[:post][:content] = 'aa'
      a
    end

    it 'is not persisted with short content' do
      res, op = described_class.run(short_desc_params)
      expect(res).to eq(false)
      expect(op.errors.to_s)
        .to eq('{:content=>["is too short (minimum is 4 characters)"]}')
      expect(op.model).to_not be_persisted
    end
  end
end
