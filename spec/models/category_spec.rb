require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        category = Category.new()
        expect(category).to be_invalid
      end

      it "has a unique name" do
        Category.create(title: "Education")
        category = Category.new(title: "Education")
        expect(category).to be_invalid
      end
    end

    context "valid attibutes" do
      it "is valid with a name" do
        category = Category.new(title: "Education")
        expect(category).to be_valid
      end
    end

  end
end
