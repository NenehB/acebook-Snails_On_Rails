require 'rails_helper'

RSpec.feature "Comments", type: :feature do

  before(:all) do 
    visit '/sign_up'
    fill_in 'First name', with: 'Rebecca'
    fill_in 'Surname', with: "Ransome"
    fill_in 'Email', with: "Beckyrose200@aol.com"
    fill_in 'Password', with: "12345678910"
    fill_in 'Password confirmation', with: "12345678910"
    choose('female')
    click_button 'Sign Up'
    
  end 

  scenario "User can comment on a post" do
    visit "/"
    fill_in "Email", with: "Beckyrose200@aol.com"
    fill_in 'Password', with: "12345678910"
    click_button 'Log In'
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "Comment", with: "Nice one!"
    click_button "Submit comment"
    expect(page).to have_content("Nice one!")
  end
end