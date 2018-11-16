require 'rails_helper'

describe "Paper details page", type: :feature do
  before(:each) do
    @paper = FactoryBot.create(:paper)
  end

  it "should render without an error" do
    visit(paper_path(@paper))
  end

  it "should list the papers' titles, venues and publication years" do
    visit(paper_path(@paper))

    expect(page).to(have_text('COMPUTING MACHINERY AND INTELLIGENCE'))
    expect(page).to(have_text('Mind 49: 433-460'))
    expect(page).to(have_text(1950))
  end

  it "should list the papers' authors" do
    visit(paper_path(@paper))
    
    expect(page).to(have_text('Alan Turing'))
  end
end
