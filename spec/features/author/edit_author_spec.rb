require 'rails_helper'

describe "Edit author page", type: :feature do

    before :each do
        @author = @author = FactoryBot.create :author
        visit edit_author_path(@author)
    end

    it "should render" do
    end

    it "should have a text input fields for an authors first name, last name and homepage" do        
        expect(page).to have_field('author[first_name]')
        expect(page).to have_field('author[last_name]')
        expect(page).to have_field('author[homepage]')
    end

    it "should successfully update the author's database entry" do
        page.fill_in 'author[first_name]', with: 'Max'
        page.fill_in 'author[last_name]', with: 'Mustermann'
        page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Max_Mustermann'
    
        find('input[type="submit"]').click
        @author.reload
    
        expect(@author.first_name).to eq('Max')
        expect(@author.last_name).to eq('Mustermann')
        expect(@author.homepage).to eq('http://wikipedia.org/Max_Mustermann')
      end

end