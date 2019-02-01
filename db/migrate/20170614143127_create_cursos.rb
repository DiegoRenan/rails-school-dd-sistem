class CreateCursos < ActiveRecord::Migration[5.1]
  def change
    create_table :cursos do |t|
      t.string :nome
      t.text :descricao
      t.string :duracao
      
      t.timestamps
    end
  end
end
