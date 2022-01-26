class Community < ApplicationRecord
  belongs_to :user
  has_many :submissions

  validates :name, :title, :description, presence: true
  validates :title, length: { minimum: 3, maximum: 15 }
  validates :name, length: { minimum: 3, maximum: 30 }
  validates :description, length: { minimum: 100, maximum: 2000 }
end
