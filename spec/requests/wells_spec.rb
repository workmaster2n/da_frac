require 'spec_helper'

describe "Wells" do
  describe "GET /wells" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get wells_path
      response.status.should be(200)
    end
  end
end
