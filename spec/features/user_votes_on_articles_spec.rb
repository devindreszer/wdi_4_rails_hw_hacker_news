require 'rails_helper'

feature 'User votes on articles' do
  background do
    @devin = create(:user, email: "devin@example.com")
    @devin.articles.create!(title: "Ruby on Rails Guides", url: "http://guides.rubyonrails.org/")
    visit root_path
    sign_in_as(@devin)
  end

  scenario 'by upvoting' do
    click_link "upvote"

    expect(page).to have_link "remove upvote"
    expect(page).to have_link "downvote"
  end

  scenario 'by removing upvote' do
    click_link "upvote"
    click_link "remove upvote"

    expect(page).to have_link "upvote"
    expect(page).to have_link "downvote"
  end

  scenario 'by downvoting' do
    click_link "downvote"

    expect(page).to have_link "remove downvote"
    expect(page).to have_link "upvote"
  end

  scenario 'by removing downvote' do
    click_link "downvote"
    click_link "remove downvote"

    expect(page).to have_link "downvote"
    expect(page).to have_link "upvote"
  end
end
