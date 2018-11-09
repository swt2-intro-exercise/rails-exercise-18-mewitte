require 'rails_helper'

describe "New author page", type: :feature do

 it "should render withour error" do
   visit new_author_path
 end

  it "should have text input for first name, last name, and homepage" do
    visit new_author_path
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should find Alan Turing in the databse if entered with correct data" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'https://wikipedia.org/wiki/Alan_Turing'
    find('input[type=submit]').click
  end
end