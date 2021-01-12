class Contact < ApplicationRecord
  belongs_to :account

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :phone, presence: true, format: { with: /\d{3}-\d{3}-\d{4}/ }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  validates_with SinglePrimaryValidator
end
