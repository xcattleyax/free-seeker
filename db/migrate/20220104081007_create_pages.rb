class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :content, null: false
      t.text :text, null: false
      t.integer :page, null: false
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
