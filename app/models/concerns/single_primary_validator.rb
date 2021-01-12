class SinglePrimaryValidator < ActiveModel::Validator
    def validate(record)
        if record.primary && Contact.exists?(account_id: record.account_id, primary: true)
            record.errors.add :primary, "There can only be 1 primary contact"
        end
    end
end