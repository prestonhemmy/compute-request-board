class User < ApplicationRecord
  # Associations

  has_many :compute_requests, dependent: :destroy

  # Validations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :lab, presence: true
end
