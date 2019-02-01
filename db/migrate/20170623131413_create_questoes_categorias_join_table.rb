class CreateQuestoesCategoriasJoinTable < ActiveRecord::Migration[5.1]
  def change
	
	create_table :categorias_questoes, id: false do |t|
		t.integer :categoria_id
		t.integer :questao_id
	end
	
  end
end
