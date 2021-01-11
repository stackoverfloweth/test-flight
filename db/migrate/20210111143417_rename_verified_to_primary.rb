class RenameVerifiedToPrimary < ActiveRecord::Migration[6.1]
  def change
    rename_column :students, :verified, :primary
  end
end
