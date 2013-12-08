require 'spec_helper'

describe "Stages" do
  describe "Try to view wells" do
    context "Admin User" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        sign_in admin
      end

      it "should be on wells page" do
        visit wells_path
        page.should have_title("Wells")
      end
    end
    context "non-admin user" do
      it "should be on home page with access error" do
        visit wells_path
        page.should have_content("You are not authorized to access this page")
      end
    end
  end
end
