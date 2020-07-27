class Bug < ApplicationRecord
  belongs_to :project

  validates :title, presence: true, uniqueness: { cass_sensitive: false }, length: { minimum: 4, maximum: 30 }
  validates :deadline, presence: true
  enum task_type: [:bug, :feature]
  enum status: [:new_ , :started, :completed, :resolved]
end