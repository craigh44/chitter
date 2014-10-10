require "spec_helper"

describe Peeps do

  it "Should create new peep" do
    Peeps.create
    expect(Peeps.count).to eq 1
  end

  
end