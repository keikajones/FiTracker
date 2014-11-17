class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :location
      t.text :bio
      t.string :activities
      t.boolean :facebook
      t.boolean :twitter
      t.boolean :instagram
      t.boolean :pinterest
      t.boolean :blog
      t.references :user

      t.timestamps
    end
  end
end
