class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.integer :status_id, null: false
      t.references :contributor, polymorphic: true, index: true
      t.timestamps
    end
  end
end
