class AddDataToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :saldo, :decimal
    add_column :accounts, :tipo_cuenta, :integer
    add_column :accounts, :tipo_familiar, :boolean
    add_reference :accounts, :user, null: false, foreign_key: true
    remove_column :accounts, :tipo
  end
end
