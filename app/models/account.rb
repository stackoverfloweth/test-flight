class Account < ApplicationRecord
    has_many :students, dependent: :destroy
    has_many :contacts, dependent: :destroy
    
    validates :name, presence: true, uniqueness: true

    # In Ruby "?" denotes a method that returns a boolean.
    def primary_contact?
        primary_contact.present?
    end

    def primary_contact
        # Returns nil if no primary contact is found.
        self.contacts.find_by(primary: true) 
    end
        
end
