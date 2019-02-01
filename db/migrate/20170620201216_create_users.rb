class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :email
      t.string :tipo

      t.timestamps
    end
  end
end
