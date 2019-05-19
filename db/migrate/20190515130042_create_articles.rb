class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :text
      t.text :image
      t.integer :user_id
      t.timestamps null: true
    end
  end
end
