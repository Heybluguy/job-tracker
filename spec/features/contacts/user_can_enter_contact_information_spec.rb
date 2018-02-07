require 'rails_helper'

describe 'as a user' do
  describe 'when im on company show page' do
    scenario 'i see a contacts form' do
      company = Company.create!(name: "ESPN")
      company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

      visit company_jobs_path(company)

      expect(page).to have_button("Add Contact")

      fill_in "contact[full_name]",	with: "Elon Musk"
      fill_in "contact[position]",	with: "Hiring Manager"
      fill_in "contact[email]",	with: "Ironman@spacex.com"

      click_on "Add Contact"

      expect(current_path).to eq(company_jobs_path(company))
      expect(page).to have_content("Elon Musk")
      expect(page).to have_content("Hiring Manager")
      expect(page).to have_content("Ironman@spacex.com")
    end
  end
end