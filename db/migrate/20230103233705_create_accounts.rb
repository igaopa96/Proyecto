class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :tipo

      t.timestamps
    end
  end
end
