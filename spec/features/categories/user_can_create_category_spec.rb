require 'rails_helper'

describe 'as a user' do
  describe 'when i fill in the new category form' do
    scenario 'I can create a new category from the form' do
      visit new_category_path

      fill_in "category[title]", with: "Web Development"

      click_button "Create"

      expect(page).to have_content("Web Development")
    end
  end
end