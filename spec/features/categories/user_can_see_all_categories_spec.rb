require 'rails_helper'

describe 'as a user' do
  describe 'when I am on the categories index page' do
    scenario 'I see all categories with edit and delete option for each one' do
      category_1 = Category.create!(title: "Education")
      category_2 = Category.create!(title: "Facilities")

      visit categories_path

      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")
    end

    scenario 'I am taken to an edit form when I ckick on edit button' do
      category_1 = Category.create!(title: "Education")

      visit categories_path
      click_on "Edit"

      expect(current_path).to eq(edit_category_path(category_1))
    end
  end
end