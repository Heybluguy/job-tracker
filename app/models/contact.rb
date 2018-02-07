class Contact < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :full_name, :position, presence: true
  belongs_to :company
end