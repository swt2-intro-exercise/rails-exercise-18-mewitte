require "rails_helper"

describe "Edit author page", type: :feature do
  it "should render without an error" do
    @author = FactoryBot.create(:author)
    visit(edit_author_path(@author))
  end

  it "should display the author's details" do
    @author = FactoryBot.create(:author)
    visit(edit_author_path(@author))

    expect(page).to(have_field('author[first_name]'))
    expect(page).to(have_field('author[last_name]'))
    expect(page).to(have_field('author[homepage]'))

    expect(find_field('author[first_name]').value).to(eq(@author.first_name))
    expect(find_field('author[last_name]').value).to(eq(@author.last_name))
    expect(find_field('author[homepage]').value).to(eq(@author.homepage))
  end

  it "should save the author's first name if changed" do
    @author = FactoryBot.create(:author)
    visit(edit_author_path(@author))

    fill_in('author[first_name]', with: "Alan Mathison")
    find('input[type="submit"]').click

    @author.reload
    expect(@author.first_name).to(eq("Alan Mathison"))
  end
end