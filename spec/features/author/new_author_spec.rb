require 'rails_helper'

describe "New author page", type: :feature do

 it "should render withour error" do
   visit(new_author_path)
 end

  it "should have text input for first name, last name, and homepage" do
    visit(new_author_path)
    expect(page).to(have_field('author[first_name]'))
    expect(page).to(have_field('author[last_name]'))
    expect(page).to(have_field('author[homepage]'))
  end

  it "should save Alan Turing in the databse if form is submitted" do
    visit(new_author_path)
    page.fill_in('author[first_name]', with: 'Alan')
    page.fill_in('author[last_name]', with: 'Turing')
    page.fill_in('author[homepage]', with: 'https://wikipedia.org/wiki/Alan_Turing')
    find('input[type=submit]').click
  end

  it "should display an author's details on his page" do
    @alan = FactoryBot.create :author
    visit(author_path(@alan))
    expect(page).to have_text('Alan')
    expect(page).to have_text('Turing')
    expect(page).to have_text('https://wikipedia.org/wiki/Alan_Turing')
  end

  it "should not create an author without a last name" do
    @alan = Author.create(first_name: 'Alan', last_name: "", homepage: 'https://wikipedia.org/wiki/Alan_Turing')
    expect(@alan).to_not(be_valid)
  end

 it "should show errors containing details when filling out the form without a first name" do
   visit(new_author_path)

   page.fill_in('author[last_name]', with: 'Turing')
   page.fill_in('author[homepage]', with: 'https://wikipedia.org/wiki/Alan_Turing')
   find('input[type="submit"]').click
   expect(page).to(have_text("First name can't be blank"))
 end

 it "should show errors containing details when filling out the form without a last name" do
   visit(new_author_path)

   page.fill_in('author[first_name]', with: 'Alan')
   page.fill_in('author[homepage]', with: 'https://wikipedia.org/wiki/Alan_Turing')
   find('input[type="submit"]').click
   expect(page).to(have_text("Last name can't be blank"))
 end

 it "should show errors containing details when filling out the form without a homepage" do
   visit(new_author_path)

   page.fill_in('author[first_name]', with: 'Alan')
   page.fill_in('author[last_name]', with: 'Turing')
   find('input[type="submit"]').click
   expect(page).to(have_text("Homepage can't be blank"))
 end
end