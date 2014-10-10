require "spec_helper"

  feature "Creating a new peep" do

   scenario "When I peep i want to see my peep" do 
      visit "/"
      add_peep("First Peep")
      peeps = Peeps.first
      expect(peeps.peep).to have_content "First Peep"
      expect(page).to have_content "First Peep"
    end

    def add_peep(peep)
      within('#new-peep') do
      fill_in "peep", :with => peep
      click_button "Peep!"
    end

  end
end