require "spec_helper"

feature "user signs up" do


  scenario "when being logged out" do 
    visit "/users/new"
    expect{sign_up("test@test.com")}.to change(User, :count).by(1)
    expect(User.first.email).to eq("test@test.com")
  end    

  def sign_up(email)
      visit "/users/new"
      expect(page.status_code).to eq(200)
      fill_in 'email', :with => email
      click_button "Sign Up"
  end


end