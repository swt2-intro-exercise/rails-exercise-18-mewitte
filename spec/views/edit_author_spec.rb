require "rails_helper"

describe "Edit author page", type: :feature do
  it "should render without an error" do
    @author = FactoryBot.create(:author)
    visit(edit_author_path(@author))
  end
end