class CreateQuestionarios < ActiveRecord::Migration[5.1]
  def change
    create_table :questionarios do |t|
      t.string :titulo
      t.text :feedback

      t.timestamps
    end
  end
end
