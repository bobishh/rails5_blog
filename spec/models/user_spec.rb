RSpec.describe User do
  let(:subject) { described_class.new }
  it { is_expected.to have_many :users_posts }
  it { is_expected.to have_many :posts }
end
