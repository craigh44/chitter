require "spec_helper"

describe Peeps do

  context "It should create new peep in database" do

  it "Should be created and retrived from db" do
    Peeps.create
    expect(Peeps.count).to eq 1
  end

  end
end