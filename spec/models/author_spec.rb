require 'rails_helper'

describe Author, type: :model do
  
  it "should be created with a first name, last name and homepage" do
    author = Author.new({first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing'})
    expect(author.first_name).to eq('Alan')
    expect(author.last_name).to eq('Turing')
    expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
  end

  it "should be able to tell its name" do
    author = Author.new({first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing'})
    expect(author.name).to eq('Alan Turing')
  end

  it "should be invalid when created without first name" do
    author = Author.new({first_name: '', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing'})
    expect(author).to_not be_valid
  end

  it "should be invalid when created without last name" do
    author = Author.new({first_name: 'Alan', last_name: '', homepage: 'http://wikipedia.org/Alan_Turing'})
    expect(author).to_not be_valid
  end

  it "should be invalid when created without homepage" do
    author = Author.new({first_name: 'Alan', last_name: 'Turing', homepage: ''})
    expect(author).to_not be_valid
  end

end
