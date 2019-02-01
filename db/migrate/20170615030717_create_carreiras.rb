class CreateCarreiras < ActiveRecord::Migration[5.1]
  def change
    create_table :carreiras do |t|
      t.string :nome
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
