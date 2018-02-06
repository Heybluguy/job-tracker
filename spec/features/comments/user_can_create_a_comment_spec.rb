require 'rails_helper'
describe 'something to be performed' do
  describe 'under condition' do
    scenario "a user sees a a form that allows them to enter a Comment for that Job" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

      visit company_job_path(company, job)

      expect(page).to have_button("Add Comment")
    end
  end
end
