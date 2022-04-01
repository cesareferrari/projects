class Activity < ApplicationRecord
  validates :content, presence: true

  belongs_to :project
  has_rich_text :content

  scope :next, -> { where(next: true) }
  scope :todo, -> { where(next: false, done: false).order(created_at: :asc) }
  scope :done, -> { where(done: true).order(updated_at: :desc) }
  scope :next_todos_for, -> (user) { joins(:project).
                                     where("project.done" => false,
                                            "project.user_id" => user.id,
                                            done: false,
                                            next: true).
                                            order("project.priority") }
end
