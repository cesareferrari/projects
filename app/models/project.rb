class Project < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :actions, dependent: :destroy

  has_rich_text :description

  scope :todo, -> { where(done: false) }
  scope :done, -> { where(done: true) }
end
