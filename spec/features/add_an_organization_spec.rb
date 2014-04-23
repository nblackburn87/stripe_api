require 'spec_helper'

describe Organization do
  context 'Creating' do
    it 'allows a user to create a new organization' do
      visit root_path
      click_link "Add New Organization"
      fill_in "Name", with: "The Sierra Club"
      fill_in "Description", with: "for tree huggers and mountaineers"
      click_button "Create Organization"
      page.should have_content "The Sierra Club"
    end
  end

  context 'Viewing' do
    it 'allows a user to view basic information about an Organization' do
      org = FactoryGirl.create(:organization)
      visit root_path
      click_link "#{org.name}"
      page.should have_content org.description
    end
  end
end

