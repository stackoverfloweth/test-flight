class Contact < ApplicationRecord
  belongs_to :account

  # Ruby convention uses snake_case for variables, symbols, etc.
  validates_presence_of :firstName, :lastName, :phone, :email
  validates_length_of :phone, is: 10
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # Ensures an account can only have as single primary contact.
  validates_uniqueness_of :primary, scope: :account_id, conditions: -> { where(primary: true) } 
  # Global Uniqueness Constraint
  # This should be handled via a unique index on the db model, but we can re-enforce that here.
  # First step would be to identify what field(s) we could use to enforce global uniqueness.
  # Seems like we could use the Phone number, email address or both.    
  validates_uniqueness_of :phone
  validates_uniqueness_of :emailex

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
