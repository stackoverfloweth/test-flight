class Account < ApplicationRecord
    has_many :students, dependent: :destroy
    has_many :contacts, dependent: :destroy
    
    validates :name, presence: true, uniqueness: true
end
