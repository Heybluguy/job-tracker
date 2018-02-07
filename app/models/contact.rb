class Contact < ApplicationRecord
  validates :full_name, :position, :email, presence: true, uniqueness: true
  belongs_to :company
end