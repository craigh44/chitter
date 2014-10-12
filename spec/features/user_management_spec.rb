require "spec_helper"

feature "user signs up" do


  scenario "when being logged out" do 
    visit "/users/new"
    expect{sign_up("Craigh44", "test@test.com", "oranges")}.to change(User, :count).by(1)
    expect(User.first.email).to eq("test@test.com")
    expect(User.first.password).to eq("oranges")
    expect(User.first.user_name).to eq("Craigh44")
  end    

  def sign_up(user_name, email, password)
    visit "/users/new"
    expect(page.status_code).to eq(200)
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    fill_in 'user_name', :with => user_name
    click_button "Sign Up"
  end

  
end