require 'rails_helper'

describe "New author page", type: :feature do
  
  it "should render withour error" do
    visit new_author_path
  end

  it "should have a text input fields for an authors first name, last name and homepage" do
    visit new_author_path
    
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should save the new author when 'submit' is clicked" do
    visit new_author_path

    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    
    find('input[type="submit"]').click
  end

  it "should display an error when not filling the form for the first name" do
    visit new_author_path

    page.fill_in 'author[first_name]', with: ''
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    
    find('input[type="submit"]').click

    expect(page).to have_text 'error'
  end

  it "should display an error when not filling the form for the last name" do
    visit new_author_path

    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: ''
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    
    find('input[type="submit"]').click

    expect(page).to have_text 'error'
  end

  it "should display an error when not filling the form for the homepage" do
    visit new_author_path

    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: ''
    
    find('input[type="submit"]').click

    expect(page).to have_text 'error'
  end

end