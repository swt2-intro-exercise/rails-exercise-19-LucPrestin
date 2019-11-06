require 'rails_helper'

describe "Index author page", type: :feature do

    before :each do
        visit authors_path
    end

    it "should render properly" do
    end

    it "should display a table of authors" do
        expect(page).to have_css 'table'
    end

    it "should display the table with columns named 'Name' and 'Homepage'" do
        within 'table' do
            expect(page).to have_text 'Name'
            expect(page).to have_text 'Homepage'
        end
    end

    it "should display an author with their full name, the homepage and a link to the detail page" do
        @author = FactoryBot.create :author 
        within 'table' do
            expect(page).to have_text 'Alan Turing'
            expect(page).to have_text 'http://wikipedia.de/Alan_Turing'
            expect(page).to have_link 'Show', href: author_path(@author)
        end
    end

    it "should have a link to the new author site" do
        expect(page).to have_link 'New', href: new_author_path
    end

end