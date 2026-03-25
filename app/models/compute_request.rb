class ComputeRequest < ApplicationRecord
  # Associations

  belongs_to :user

  # Enums

  enum :status, {
    submitted: "submitted",
    approved: "approved",
    running: "running",
    completed: "completed",
    rejected: "rejected"
  }, default: "submitted"

  enum :priority, {
    low: "low",
    medium: "medium",
    high: "high",
    urgent: "urgent"
  }, default: "medium"

  enum :partition, {
    default: "default",
    gpu: "gpu",
    bigmem: "bigmem",
    burst: "burst"
  }, default: "default"

  # Validations

  validates :title, presence: true
  validates :gpu_count, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 8 }
  validates :cpu_cores, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 40 }
  validates :memory_gb, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 512 }
  validates :hours,     numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 72 }
end
