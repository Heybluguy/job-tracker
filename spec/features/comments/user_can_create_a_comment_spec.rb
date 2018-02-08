require 'rails_helper'
describe 'as a user' do
  describe 'when i am on job show page' do
    scenario "a user sees a a form that allows them to enter a Comment for that Job" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

      visit job_path(job)

      expect(page).to have_button("Add Comment")

      fill_in "comment[content]",	with: "Great place to work!"

      click_on "Add Comment"

      expect(current_path).to eq(job_path(job))
      expect(page).to have_content("Great place to work!")

      fill_in "comment[content]",	with: "Not a safe work environment."

      click_on "Add Comment"

      expect(current_path).to eq(job_path(job))
      expect(page).to have_content("Not a safe work environment.")
    end
  end
end
