class AddDataToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :telefono, :integer
    add_column :users, :tipo_usuario, :integer
    add_reference :users, :family, null: true, foreign_key: true
  end
end
