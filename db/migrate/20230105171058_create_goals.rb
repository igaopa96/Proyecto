class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :nombre
      t.string :descripcion
      t.decimal :cantidad
      t.decimal :saldo
      t.references :family, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
