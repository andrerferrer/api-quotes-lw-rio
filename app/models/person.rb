class Person < ApplicationRecord
  has_many :quotes, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  before_save { self.name = name.downcase }
end
