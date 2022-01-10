class CreateScadules < ActiveRecord::Migration[6.0]
  def change
    create_table :scadules do |t|
      t.date :date, null: false
      t.string :content, null: false
      t.text :text, null: false
      t.timestamps
    end
  end
end