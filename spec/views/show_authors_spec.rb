require "rails_helper"

describe "Show authors page", type: :feature do
  it "should render without an error" do
    visit authors_path

  end
end