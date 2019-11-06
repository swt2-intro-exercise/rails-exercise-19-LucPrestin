require 'rails_helper'

RSpec.describe Paper, type: :model do
    it "should be created with a title, venue and publishing year" do
        paper = Paper.new({title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: 'Mind 49: 433-460', year: 1950})
        expect(paper.title).to eq('COMPUTING MACHINERY AND INTELLIGENCE')
        expect(paper.venue).to eq('Mind 49: 433-460')
        expect(paper.year).to eq(1950)
    end

    it "should be invalid when created without title" do
        paper = Paper.new({title: '', venue: 'Mind 49: 433-460', year: 1950})
        expect(paper).to_not be_valid
    end
    
    it "should be invalid when created without venue" do
        paper = Paper.new({title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: '', year: 1950})
        expect(paper).to_not be_valid
    end
    
    it "should be invalid when created without year" do
        paper = Paper.new({title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: 'Mind 49: 433-460', year: nil})
        expect(paper).to_not be_valid
    end
end
