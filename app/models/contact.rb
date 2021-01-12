class Contact < ApplicationRecord
  belongs_to :account

  validates_presence_of :firstName, :lastName, :phone, :email
  validates_length_of :phone, is: 10
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_with SinglePrimaryValidator

  before_validation :sanitize_phone_number
  
  
  def is_primary?
    # Truthy allows us to treat nil and false the same, but passing nil to ruby methods that 
    # expect true or false could possibly get us in trouble. Best approach normally is to set a default
    # value for our booleans when defining our schema.  However, for this, we can use .present to force 
    # our value to false, if nil.
    self.primary.present?    
  end

  private 

  def sanitize_phone_number
    self.phone = phone.gsub(/\W/, '')
  end

end
