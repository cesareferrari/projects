class User < ApplicationRecord
  has_secure_password
  has_many :projects, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true,
    format: { with: /\S+@\S+/ },
    uniqueness: { case_sensitive: false }

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end
end
