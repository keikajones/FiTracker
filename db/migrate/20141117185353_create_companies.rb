class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.text :bio
      t.string :category
      t.string :site_url
      t.boolean :facebook
      t.boolean :twitter
      t.boolean :instagram
      t.boolean :pinterest
      t.boolean :blog
      t.references :user, index: true

      t.timestamps
    end
  end
end
