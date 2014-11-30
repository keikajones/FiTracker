class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.text :body_html
      t.references :user, index: true

      t.timestamps
    end
  end
end
