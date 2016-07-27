require 'rails_helper'

RSpec.feature 'Posts scenarions', type: :feature do
  let!(:posts) { FactoryGirl.create_list(:post, 1) }

  before do
    visit '/posts'
  end

  scenario 'get posts index' do
    expect(page).to have_text('Listing posts')
    expect(page).to have_text(posts[0].title)
  end

  scenario 'go to individual post' do
    click_link posts[0].title
    expect(page).to have_text(posts[0].title)
    expect(page).to have_text(posts[0].content)
  end

  scenario 'create a post'
  scenario 'edit a post'
end
