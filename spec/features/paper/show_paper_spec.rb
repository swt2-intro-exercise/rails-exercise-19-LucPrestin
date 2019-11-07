require 'rails_helper'

describe "Show paper page", type: :feature do

    it "should display a paper's details" do
        @paper = FactoryBot.create :paper 
        visit paper_path(@paper)

        expect(page).to have_text('Title: COMPUTING MACHINERY AND INTELLIGENCE')
        expect(page).to have_text('Venue: Mind 49: 433-460')
        expect(page).to have_text('Year: 1950')
    end

    it "should display a paper's authors" do
        @author = FactoryBot.create :author
        @paper = FactoryBot.create :paper

        visit paper_path(@paper)

        expect(page).to have_text('Alan Turing')
    end

end