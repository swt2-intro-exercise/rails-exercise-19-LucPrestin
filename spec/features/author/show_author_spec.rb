require 'rails_helper'

describe "Show author page", type: :feature do

    it "should display an author's details" do
        @author = FactoryBot.create :author 
        visit author_path(@author)

        expect(page).to have_text('First name: Alan')
        expect(page).to have_text('Last name: Turing')
        expect(page).to have_text('Homepage: http://wikipedia.de/Alan_Turing')
    end

end