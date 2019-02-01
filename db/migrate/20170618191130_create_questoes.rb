class CreateQuestoes < ActiveRecord::Migration[5.1]
  def change
    create_table :questoes do |t|
      t.text :questao
      t.integer :valor
      t.text :feedback
      t.integer :penalidade
      t.references :questionario, foreign_key: true

      t.timestamps
    end
  end
end
