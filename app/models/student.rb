class Student < ApplicationRecord
  belongs_to :account

  validates_presence_of :firstName, :lastName, :age
  validates :age, numericality: { only_integer: true, greater_than: 2, less_than: 100 }
end
