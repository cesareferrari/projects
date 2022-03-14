class Project < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :activities, dependent: :destroy
  has_one_attached :cover

  has_rich_text :description

  scope :todo, -> { where(done: false).order(:priority) }
  scope :done, -> { where(done: true).order(updated_at: :desc) }
end
