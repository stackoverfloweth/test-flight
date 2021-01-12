class Contact < ApplicationRecord
  belongs_to :account

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :phone, presence: true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Not valid phone #" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Not valid email address" } 
  
  validates_with SinglePrimaryValidator
end
