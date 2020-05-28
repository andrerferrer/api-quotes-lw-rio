class Quote < ApplicationRecord
  belongs_to :person
  validates :content, presence: true
end
