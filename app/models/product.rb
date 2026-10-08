class Product < ApplicationRecord
  validates :name, :material, :size, :price, :description, presence: true
  validates :material, inclusion: { in: %w[金 銀 銅] }
  validates :size, inclusion: { in: %w[大 中 小] }
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
