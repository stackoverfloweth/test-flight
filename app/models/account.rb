class Account < ApplicationRecord
    has_many :students, dependent: :destroy
    
    validates :name, presence: true
    validates_uniqueness_of :name
end
