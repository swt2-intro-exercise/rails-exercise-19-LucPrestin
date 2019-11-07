require 'rails_helper'

describe "Index paper page", type: :feature do

    before :each do
        @paper = FactoryBot.create :paper 
        visit papers_path
    end

    it "should render properly" do
    end

    it "should display a table of papers" do
        expect(page).to have_css 'table'
    end

    it "should display the table with columns named 'Title', 'Venue' and 'Year'" do
        within 'table' do
            expect(page).to have_text 'Title'
            expect(page).to have_text 'Venue'
            expect(page).to have_text 'Year'
        end
    end

    it "should display a paper with its title, venue, year and a link to the detail page" do
        within 'table' do
            expect(page).to have_text 'COMPUTING MACHINERY AND INTELLIGENCE'
            expect(page).to have_text 'Mind 49: 433-460'
            expect(page).to have_text 1950
            expect(page).to have_link 'Show', href: paper_path(@paper)
        end
    end

    it "should display the paper with a link to the edit page" do
        within 'table' do
            expect(page).to have_link 'Edit', href: edit_paper_path(@paper)
        end
    end

    it "should display the paper with a link to delete the paper" do
        within 'table' do
            expect(page).to have_link 'Delete', href: paper_path(@paper)
        end
    end

    it "should delete a paper when its delete link is clicked" do
        within 'table' do
            paper_count_before_deletion = Paper.count
            find('a[data-method="delete"]').click
            expect(paper_count_before_deletion).to eq (Paper.count + 1)
        end
    end

    it "should have a link to the new paper site" do
        expect(page).to have_link 'New', href: new_paper_path
    end

    it "should not display a paper of year 1950 when the papers are filtered by the year 1968" do
        visit papers_path(:year => 1968)
        within 'table' do
            expect(page).to_not have_text 'COMPUTING MACHINERY AND INTELLIGENCE'
        end
    end

end