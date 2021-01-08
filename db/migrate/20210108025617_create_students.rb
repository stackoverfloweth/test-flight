class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :firstName
      t.string :lastName
      t.integer :age
      t.boolean :verified
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
