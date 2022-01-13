class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :question, null: false
      t.text :answer, null: false
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
