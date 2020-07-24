class Project < ApplicationRecord
  belongs_to :user
  validates :name,  presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 5, maximum: 30}
end