require 'rails_helper'

describe "New paper page", type: :feature do
  
  before :each do
    visit new_paper_path
  end

  it "should render withour error" do
  end

  it "should have a text input fields for a papers title, venue and year" do
    
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should save the new paper when 'submit' is clicked" do
    page.fill_in 'paper[title]', with: 'COMPUTING MACHINERY AND INTELLIGENCE'
    page.fill_in 'paper[venue]', with: 'Mind 49: 433-460'
    page.fill_in 'paper[year]', with: 1950
    
    find('input[type="submit"]').click
  end

  it "should display an error when not filling the form for the title" do
    page.fill_in 'paper[title]', with: ''
    page.fill_in 'paper[venue]', with: 'Mind 49: 433-460'
    page.fill_in 'paper[year]', with: 1950
    
    find('input[type="submit"]').click

    expect(page).to have_text 'error'
  end

  it "should display an error when not filling the form for the venue" do
    page.fill_in 'paper[title]', with: 'COMPUTING MACHINERY AND INTELLIGENCE'
    page.fill_in 'paper[venue]', with: ''
    page.fill_in 'paper[year]', with: 1950
    
    find('input[type="submit"]').click

    expect(page).to have_text 'error'
  end

  it "should display an error when not filling the form for the year" do
    page.fill_in 'paper[title]', with: 'COMPUTING MACHINERY AND INTELLIGENCE'
    page.fill_in 'paper[venue]', with: 'Mind 49: 433-460'
    page.fill_in 'paper[year]', with: ''
    
    find('input[type="submit"]').click

    expect(page).to have_text 'error'
  end

end