class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :firstName
      t.string :lastName
      t.string :phone
      t.string :email
      t.boolean :primary
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
