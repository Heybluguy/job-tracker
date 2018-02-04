require 'rails_helper'

describe "as a user" do
  scenario "I can delete a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit "/companies/#{company.id}/jobs"

    click_on "Delete"

    expect(page).not_to have_content("Developer")
    expect(current_path).to eq(company_jobs_path(company))
  end
end

