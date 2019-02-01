class CreateNoticias < ActiveRecord::Migration[5.1]
  def change
    create_table :noticias do |t|
      t.string :titulo
      t.text :texto
      t.string :uf
      t.string :vaga
      t.string :salario
      t.string :banca
      t.string :edital
      t.string :inscricao
      t.string :cargo
      t.string :resume

      t.timestamps
    end
  end
end
