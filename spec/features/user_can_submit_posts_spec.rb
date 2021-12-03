require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

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

  scenario "Can submit posts and view them" do
    visit "/"
    fill_in "Email", with: "Beckyrose200@aol.com"
    fill_in 'Password', with: "12345678910"
    click_button 'Log In'
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "User can like a post" do
    
    visit "/"
    fill_in "Email", with: "Beckyrose200@aol.com"
    fill_in 'Password', with: "12345678910"
    click_button 'Log In'
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_button ("Likes")
    expect(page).to have_button("1 Likes")
  end 

  scenario 'Posts are displayed in descending order' do
    visit "/"
    fill_in "Email", with: "Beckyrose200@aol.com"
    fill_in 'Password', with: "12345678910"
    click_button 'Log In'
    fill_in "Message", with: "First post"
    click_button "Submit"
    fill_in "Message", with: "Second post"
    click_button "Submit"
    expect('Second post').to appear_before('First post')
  end
end
