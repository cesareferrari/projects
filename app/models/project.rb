class Project < ApplicationRecord
  before_validation :assign_default_category, on: :create

  validates :name, presence: true
  validate :acceptable_cover

  belongs_to :category
  belongs_to :user
  has_many :activities, dependent: :destroy
  has_one_attached :cover

  has_rich_text :description

  scope :todo, -> { where(done: false).order(:priority) }
  scope :done, -> { where(done: true).order(updated_at: :desc) }

  def todos_count
    activities.where(done: false).count
  end

  private

  def acceptable_cover
    return unless cover.attached?

    unless cover.blob.byte_size <= 1.megabyte
      errors.add(:cover, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(cover.content_type)
      errors.add(:cover, "must be a JPEG or PNG")
    end
  end

  def assign_default_category
    if category.nil?
      self.category = Category.find_by(name: "Administration")
    end
  end
end
