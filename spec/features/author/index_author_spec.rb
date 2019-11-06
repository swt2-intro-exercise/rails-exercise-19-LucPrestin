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

    it "should display the authors according to their name and homepage and have a link to the author's show page" do
        @author = FactoryBot.create :author 
        within 'table' do
            expect(page).to have_text 'Name'
            expect(page).to have_text 'Homepage'
            expect(page).to have_link 'Show', href: author_path(@author)
        end
    end

    it "should have a link to the new author site" do
        expect(page).to have_link 'New', href: new_author_path
    end

end