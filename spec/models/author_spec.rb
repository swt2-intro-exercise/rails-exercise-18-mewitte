require 'rails_helper'

describe Author, type: :model do
  it "should save users when entering a user" do
    author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'https://wikipedia.org/wiki/Alan_Turing')
    expect(author.first_name).to eq('Alan')
    expect(author.last_name).to eq('Turing')
    expect(author.homepage).to eq('https://wikipedia.org/wiki/Alan_Turing')
  end

  it "should return the full name on #name" do
    author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'https://wikipedia.org/wiki/Alan_Turing')
    expect(author.name).to eq('Alan Turing')
  end
end
