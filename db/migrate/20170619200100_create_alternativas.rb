class CreateAlternativas < ActiveRecord::Migration[5.1]
  def change
    create_table :alternativas do |t|
      t.text :alternativa
      t.boolean :qualidade, default: false
      t.references :questao, foreign_key: true

      t.timestamps
    end
  end
end
