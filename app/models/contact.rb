class Contact < ApplicationRecord
  belongs_to :account

  validates_presence_of :firstName, :lastName, :phone, :email
  validates_length_of :phone, is: 10
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  validates_with SinglePrimaryValidator

  before_validation :sanitize_phone_number


  private 

  def sanitize_phone_number
    self.phone = phone.gsub(/\W/, '')
  end

end
