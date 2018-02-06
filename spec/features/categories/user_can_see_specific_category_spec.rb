require 'rails_helper'

describe 'as a user' do
  describe 'when I am on a specific category page' do
    scenario 'I can see all jobs for that category' do
      category = Category.create!(title: "Engineering")
      company = Company.create!(name: "ESPN")
      company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
      company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)

      visit category_path(category)

      expect(page).to have_content("Developer")
      expect(page).to have_content("QA Analyst")
    end
  end
end