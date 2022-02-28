class Project < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  scope :todo, -> { where(done: false) }
  scope :done, -> { where(done: true) }
end
