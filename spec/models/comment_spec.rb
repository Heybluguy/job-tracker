require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        comment = Comment.new(job: job)

        expect(comment).to be_invalid
      end
    end

    context "valid attibutes" do
      it "is valid with content" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        comment = Comment.new(content: "Great Place.", job: job)

        expect(comment).to be_valid
      end
    end
  end
end
