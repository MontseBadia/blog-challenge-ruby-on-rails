class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :category
      t.integer :readable_time
      t.string :body
      t.string :language
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
