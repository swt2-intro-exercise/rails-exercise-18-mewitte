require 'rails_helper'

RSpec.describe "Paper Edit page", type: :feature do
  before(:each) do
    @paper = FactoryBot.create(:paper)
    visit(edit_paper_path(@paper))
  end

  it "should display the paper's details" do
    expect(page).to(have_field('paper[title]'))
    expect(page).to(have_field('paper[venue]'))
    expect(page).to(have_field('paper[year]'))

    expect(find_field('paper[title]').value).to(eq(@paper.title))
    expect(find_field('paper[venue]').value).to(eq(@paper.venue))
    expect(find_field('paper[year]').value).to(eq(@paper.year.to_s))
  end

  it "should save the paper's titleif changed" do
    fill_in('paper[title]', with: "kappa")
    find('input[type="submit"]').click

    @paper.reload
    expect(@paper.title).to(eq("kappa"))
  end

  it "should have one multiple select box to select paper authors from" do
    expect(page).to(have_css("select[multiple]", count: 1))
  end

  it "should update authors of a paper" do
    @author = Author.create(first_name: 'Peter', last_name: 'Plagiarist', homepage: 'http://www.peter-plagiarist.com')
    authors = @paper.authors.count

    visit edit_paper_path(@paper)

    page.select(@author.name, from: "paper[author_ids][]")
    find('input[type="submit"]').click

    @paper.reload

    expect(@paper.authors.count).to(eq(authors + 1))
    expect(@paper.authors).to(include(@author))
  end
end
