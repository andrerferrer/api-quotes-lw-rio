class Person < ApplicationRecord
  before_save { self.name = name.downcase }
end
