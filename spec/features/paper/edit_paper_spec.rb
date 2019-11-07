require 'rails_helper'

describe "Edit paper page", type: :feature do

    before :each do
        @paper = FactoryBot.create :paper
        visit edit_paper_path(@paper)
    end

    it "should render" do
    end

    it "should have a text input fields for a papers title, venue and year" do        
        expect(page).to have_field('paper[title]')
        expect(page).to have_field('paper[venue]')
        expect(page).to have_field('paper[year]')
    end

    it "should successfully update the papers's database entry" do
        page.fill_in 'paper[title]', with: 'COMPUTING THINGIES'
        page.fill_in 'paper[venue]', with: 'Mind 45: 344-347'
        page.fill_in 'paper[year]', with: 2050
    
        find('input[type="submit"]').click
        @paper.reload
    
        expect(@paper.title).to eq('COMPUTING THINGIES')
        expect(@paper.venue).to eq('Mind 45: 344-347')
        expect(@paper.year).to eq(2050)
    end

    it "should have a multiple select box" do
        expect(page).to have_css 'select'
    end

end