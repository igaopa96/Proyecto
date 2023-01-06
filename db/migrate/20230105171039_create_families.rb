class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.decimal :saldo
      t.string :nombre
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
