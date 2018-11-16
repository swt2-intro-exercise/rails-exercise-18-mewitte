require 'rails_helper'

RSpec.describe Paper, type: :model do

  it "should have an empty list of authors" do
    @paper = FactoryBot.create(:paper)
    expect(@paper.authors.exists?)
  end
end
