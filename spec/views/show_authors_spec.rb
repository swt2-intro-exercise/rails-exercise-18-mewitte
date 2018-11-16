require "rails_helper"

describe "Show authors page", type: :feature do
  it "should render without an error" do
    visit authors_path
  end

  it "should display the names of the authors" do
    FactoryBot.create :author
    visit authors_path
    expect(page).to have_text("Alan Turing")
  end

  it "should link to the authors' profiles" do
    @alan = FactoryBot.create :author
    visit authors_path
    expect(page).to have_link('Show', href: author_path(@alan))
  end

  it "should have a link to create a new author" do
    FactoryBot.create :author
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
  end

  it "should have a link to the edit author page" do
    @author = FactoryBot.create(:author)
    visit(authors_path)
    expect(page).to(have_link('Edit', href: edit_author_path(@author)))
  end

  it "should have a link to delete an author" do
    @author = FactoryBot.create(:author)
    url = author_path(@author)
    visit(authors_path)
    expect(page).to(have_css("a[data-method='delete'][href='#{url}']"))
  end
end