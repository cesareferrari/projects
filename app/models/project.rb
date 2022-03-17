class Project < ApplicationRecord
  BG_COLORS = %w[
    bg-amber-200
    bg-amber-300
    bg-indigo-200
    bg-indigo-300
    bg-purple-300
    bg-stone-400
    bg-red-300
    bg-orange-300
    bg-emerald-300
    bg-cyan-300
  ]

  validates :name, presence: true
  validate :acceptable_cover

  belongs_to :user
  has_many :activities, dependent: :destroy
  has_one_attached :cover

  has_rich_text :description

  scope :todo, -> { where(done: false).order(:priority) }
  scope :done, -> { where(done: true).order(updated_at: :desc) }

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
end
