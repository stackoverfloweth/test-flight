class RemovePrimaryFromStudent < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :primary
  end
end
