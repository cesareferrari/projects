class Project < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  has_rich_text :description

  scope :todo, -> { where(done: false) }
  scope :done, -> { where(done: true) }
end
