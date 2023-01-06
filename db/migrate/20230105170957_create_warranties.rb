class CreateWarranties < ActiveRecord::Migration[6.0]
  def change
    create_table :warranties do |t|
      t.string :nombre
      t.string :no_identificacion
      t.date :fecha_adq
      t.string :estado
      t.integer :periodo_dias
      t.integer :dias_restantes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
