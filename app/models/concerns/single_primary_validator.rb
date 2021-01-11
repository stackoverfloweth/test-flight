class SinglePrimaryValidator < ActiveModel::Validator
    def validate(record)
        if record.primary && Student.exists?(account_id: record.account_id, primary: true)
            record.errors.add :primary, "There can only be 1 primary student"
        end
    end
end