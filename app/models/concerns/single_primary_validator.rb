
# I like this, but given we are only using the SinglePrimaryValidator inside a single
# place, we should keep this logic inside the Contact model.  

class SinglePrimaryValidator < ActiveModel::Validator
    def validate(record)
        if record.primary && Contact.exists?(account_id: record.account_id, primary: true)
            record.errors.add :primary, "There can only be 1 primary contact"
        end
    end
end 