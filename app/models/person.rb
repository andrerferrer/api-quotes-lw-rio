class Person < ApplicationRecord
  has_many :quotes, dependent: :destroy

  before_save { self.name = name.downcase }
end
