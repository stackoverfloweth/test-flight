class Student < ApplicationRecord
  belongs_to :account

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 18, less_than: 100 }
  validates_with SinglePrimaryValidator
end
