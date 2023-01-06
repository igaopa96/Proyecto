class CreateConcepts < ActiveRecord::Migration[6.0]
  def change
    create_table :concepts do |t|
      t.string :nombre
      t.integer :tipo
      t.string :descripcion
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
