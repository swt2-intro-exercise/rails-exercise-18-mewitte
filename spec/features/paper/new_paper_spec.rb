require 'rails_helper'

describe "New Paper page", type: :feature do

  it "should render without error" do
    visit new_paper_path
  end

  it "should have text input for title, venue and year" do
    visit(new_paper_path)
    expect(page).to(have_field('paper[title]'))
    expect(page).to(have_field('paper[venue]'))
    expect(page).to(have_field('paper[year]'))
  end

  it "should save a paper in the database if data is submitted" do
    visit(new_paper_path)
    page.fill_in('paper[title]', with: 'COMPUTING MACHINERY AND INTELLIGENCE')
    page.fill_in('paper[venue]', with: 'Mind 49: 433-460')
    page.fill_in('paper[year]', with: 1950)
    find('input[type=submit]').click
  end

  it "should not create a paper without a title" do
    @paper = Paper.new(title: '', venue: 'Mind 49: 433-460', year: 1950)
    expect(@paper).to_not(be_valid)
  end

  it "should not create a paper without a venue" do
    @paper = Paper.new(title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: '', year: 1950)
    expect(@paper).to_not(be_valid)
  end

  it "should not create a paper without a year" do
    @paper = Paper.new(title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: 'Mind 49: 433-460', year: '')
    expect(@paper).to_not(be_valid)
  end

  it "should not create a paper with a year that's not an integer" do
    @paper = Paper.new(title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: 'Mind 49: 433-460', year: 'kappa')
    expect(@paper).to_not(be_valid)
  end
end