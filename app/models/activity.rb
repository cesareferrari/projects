class Activity < ApplicationRecord
  validates :content, presence: true

  belongs_to :project
  has_rich_text :content
end
