class Activity < ApplicationRecord
  validates :content, presence: true

  belongs_to :project
  has_rich_text :content

  scope :todo, -> { where(done: false) }
  scope :done, -> { where(done: true) }
end
